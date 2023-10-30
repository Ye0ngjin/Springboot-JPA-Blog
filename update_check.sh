#!/bin/bash

# 파일에 대한 실행 권한을 부여하고
# chmod +x update_check.sh
# chmod +x auto_update.sh
# 다음을 실행시켜서
# crontab -e
# 다음을 추가해서, 스케줄링해준다.
# */10 * * * * /bin/bash ~/Springboot-JPA-Blog/update_check.sh > /dev/null 2>&1

# 스크립트가 실행될 디렉토리 설정
cd ~/Springboot-JPA-Blog

# Git 저장소 상태 저장
git rev-parse HEAD > target/status_before_update.txt

# 최신 변경 사항 가져오기
git pull

# Git 저장소 상태 저장
git rev-parse HEAD > target/status_after_update.txt

# 이전 상태와 최신 상태 비교
if diff target/status_before_update.txt target/status_after_update.txt &> /dev/null
then
  echo "$(date +'%Y-%m-%d-%H-%M-%S')	변화 없음" | tee -a target/nohup.out
else
  # 변경 사항이 있는 경우 스크립트 재실행 또는 조치 수행
  echo "$(date +'%Y-%m-%d-%H-%M-%S')	깃 수정됨." | tee -a target/nohup.out
  
  # Git 변경 내용 확인
  changes=$(git diff --name-only HEAD~1 HEAD)

  # 변경 내용 중에서 src/main/로 시작하는 경로 확인
  if echo "$changes" | grep -q '^src/main/'; then
    echo "Changes found in src/main/ folder or its subdirectories." | tee -a target/nohup.out
    # 스크립트 실행
    /bin/bash auto_update.sh
  else
    echo "No changes found in src/main/ folder or its subdirectories." | tee -a target/nohup.out
  fi
fi
