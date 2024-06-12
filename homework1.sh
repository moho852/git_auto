#!/bin/sh

# 질문 출력
echo "Do you like an apple?"

read answer # 입력값 저장
case $answer in # case문 사용
	yes | YES)             # 만약 yes(대소문자 혼용가능) 면 i like an apple too 출력
		echo "I like an apple too.";;
	["no"]*|["NO"]*) # 만약 no 또는 NO로 시작하는 문자 시작하면 문자가 들어오면 Sorry 출력 
		echo "Sorry!";;
	*) 		 # 그외 문자가 들어오면 Ok that is great를 출력
		echo "OK, that is great.";;
esac 		 	 # case문 끝
exit 0
