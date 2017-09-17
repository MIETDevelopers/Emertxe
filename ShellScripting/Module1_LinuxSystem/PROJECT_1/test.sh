#!/bin/bash
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Expected Solution From  Script <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#This Script Changes the  Test-Question Randomly and validates the answer and prints the result in the Result_page with marks-obtained 


#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Beginning of the Script <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

source color.sh
source exit.sh


if [ $1 ]
then
	count_of_question=(`ls ./QUESTION_BANK | grep -i --regexp=.*\.txt | wc -l`)
	count=1
	total_marks=0

	rand=(`shuf -i 1-$count_of_question -n  10`)
	evaluation_file=(`cat ./QUESTION_BANK/answer.csv`)
	evaluation_sheet=(` sed 's/;/ /g'   ./QUESTION_BANK/answer.csv `)
	  
	for(( i=0; i<10; i++))
	do
		clear
		rearranged_evaluation_sheet=${evaluation_sheet[${rand[i]}-1]}	
          	echo -e "\n$blue$bold                             [ Test ]                                     $normal"
         	echo -e "$green                                                                          $normal"
          	echo -en "$green                                                            $rg_red Hello  $normal"
          	echo -en "$bold $1$normal\n"
        	echo -e "$green                                                                          $normal"
          	echo -e "$green                                                                          $normal"
	  	echo -e ""
	  	echo -e "$count)`cat ./QUESTION_BANK/question${rand[i]}.txt`"
	  	echo -e ""
          	echo -e "$green                                                                          $normal"
          	echo -e "$green                                                                          $normal"
		count=$(($count+1))
	 	echo -ne "$blue$bold[Enter your Option]:$normal"
	 	read -t 30   user_answer

		 if [ $user_answer ]
	 	 then
	 		if [ $user_answer == ${evaluation_sheet[${rand[i]}-1]} ]
	 		then
				total_marks=$(($total_marks+1))
		
	 	 	fi
	 	 fi

	done

	bash  test_result.sh  $1 $2 $3 $4 $5 $6 $total_marks


else
	echo -e "\n$red[ERROR]$normal Please Sign-in [Test-Software] $red[ERROR]$normal\n"
	bash index_page.sh
fi
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> End of the Script <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
