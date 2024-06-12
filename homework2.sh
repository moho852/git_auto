#!/bin/sh

start=/home/ubuntu/homework/start.txt #start.txt 파일 저장
hap=/home/ubuntu/homework/hap.txt     #hap.txt 파일 저장
if [ -f $start ] && [ -f $hap ]        #만약 start.txt 파일과 hap.txt 파일이 존재하면 
then				      	
	
	start=$(cat start.txt)	       # start.txt에 저장된 값을 start 변수에 할당	
	hap=$(cat hap.txt)	       # hap.txt에 저장된 값을 hap 변수에 할당 
	for i in $(seq $start 1000)    # start 부터 1000까지 반복
	do
		sleep 0.1 	       # 0.1마다 sleep
		hap=`expr $hap + $i`   # hap 변수에 i를 저장
		echo "current number is " $i     # i 출력
		echo "sum is "$hap     # hap 출력
		echo $i > start.txt    # i를 start.txt에 저장
		echo $hap > hap.txt    # hap을 hap.txt에 저장
	done
else				       # 만약 파일이 존재하지 않는다면
	echo 1 > start.txt             # start.txt 1로 초기화
	echo 0 > hap.txt	       # hap.txt 0으로 초기화

	start=$(cat start.txt)         # 위와 동일한 방식으로 동작
        hap=$(cat hap.txt)
        for i in $(seq $start 1000)
        do      
                sleep 0.1
                hap=`expr $hap + $i`
                echo "current number is " $i
                echo "sum is "$hap
                echo $i > start.txt
                echo $hap > hap.txt
        done
fi

