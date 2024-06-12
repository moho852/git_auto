#!bin/sh

touch log.txt 								# 상태를 기록해줄 log.txt 파일 생성

cnt=0
while [ 1 ]								#while 문을 반복
do	
	cpu=$(top -bn1 | grep "Cpu(s)" | awk '{printf("%d", $2)}')	#cpu 사용량 측정 후 정수 타입으로 변수에 저장
	if [ $cpu -ge 5 ]						#만약 cpu 사용량이 5% 이상이면 
	then	
									# cpu가 임계값을 넘었습니다  text를 담은 webhook 전달
		curl -H "Content-Type: application/json" -d "{\"text\": \"상태 : cpu가 임계값을 넘었습니다.       시간 : $date       cup : $cpu %\"}" https://o365kopo.webhook.office.com/webhookb2/b1f3ecd1-99cb-40d5-b1a1-42a78ee8de08@ad21525c-fc0f-4dbc-a403-67ce00add0e4/IncomingWebhook/847f7a2cee20488fa360e97b1af80a34/b2977237-cc03-42ef-a2a2-a5f302f79073	
		date=$(date)
		echo "상태 : cpu가 임계값을 넘었습니다.       시간 : $date       cup : $cpu %"            # 상태 출력
		echo "상태 : cpu가 임계값을 넘었습니다.	      시간 : $date       cup : $cpu %" >> log.txt # cpu 상태를 log에 저장		
	else								# 만약 cpu 사용량이 5% 이하라면
	        date=$(date)	
		echo "상태 : cpu가 정상 상태입니다.           시간 : $date       cup : $cpu %"
		echo "상태 : cpu가 정상 상태입니다.           시간 : $date       cup : $cpu %" >> log.txt	
		cnt=`expr $cnt + 1`					# while문 1회 반복될 때마다 cnt 1 증가
	fi
	if [ $cnt -eq 60 ]						# 만약 cnt 가 60이면
	then
		break							# 반복문을 벗어남
	fi

done

