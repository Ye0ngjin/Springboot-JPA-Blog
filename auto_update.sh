#!/bin/bash

cd ~/Springboot-JPA-Blog

# 1. 현재 실행 중인 웹 애플리케이션 프로세스 종료, grep -v "grep"은 그랩 명령이 실행되는 프로세스가 나오는 것을 방지한다.
PID=$(ps aux | grep "blog-0.0.1-SNAPSHOT.war" | grep -v "grep" | awk '{print $2}')
if [ -n "$PID" ]; then
    echo "Stopping the existing web application process (PID: $PID)" | tee -a target/nohup.out
    kill -9 $PID
fi

# 2. 로그 파일 이름 변경, 이름 바꿀 때 따옴표로 묶는 이유는 공백 포함시 에러를 피하기 위해
LOGFILE="nohup-$(date +'%Y-%m-%d-%H-%M-%S').out"
mv target/nohup.out "target/$LOGFILE"
echo "Log file renamed to $LOGFILE from nohup.out" | tee -a "target/$LOGFILE"

# 3. 다시 빌드
echo "building the application..."
mvn package | tee -a "target/$LOGFILE"

# 4. 실행 파일 권한 변경
echo "Changing the execution permissions of the application..."
chmod 775 target/blog-0.0.1-SNAPSHOT.war | tee -a "target/$LOGFILE"

# 5. 웹 애플리케이션 다시 실행
cd target
echo "Starting the web application..."| tee -a "$LOGFILE"
nohup java -jar blog-0.0.1-SNAPSHOT.war > nohup.out 2>&1 &
