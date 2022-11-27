# Create your grading script here

#set -e
 
rm -rf student-submission
git clone $1 student-submission
 
score=0
 
# check the existence of the file
FILE=student-submission/ListExamples.java
SUBMISSION_FILE=ListExamples.java
if [[ -f "$FILE" ]]
then
   echo "$SUBMISSION_FILE is submitted successfully. [1 piont]"
   ((score+=1))
else
   echo "$SUBMISSION_FILE is not found."
   echo "Grade: [$score/3]"
   exit
fi
 

cp TestListExamples.java student-submission
cp -rf lib student-submission
cd student-submission
CPATH=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"
 
# check if file compiles
javac -cp $CPATH *.java 2> compile_error.txt

if [[ $? -eq 0 ]]; then
    echo "$SUBMISSION_FILE compiled succssfully. [1 point]"
    ((score+=1))
 
else
    echo "Compile Error"
    cat compile_error.txt
    echo "Grade: [$score/3]"
    exit
fi


#run tests
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test_result.txt
if [[ $? -eq 0 ]];then
   echo "All tests passed. [1 point]"
   ((score+=1))
else
   echo "Some tests failed."
   grep "Tests run" test_result.txt
fi
echo "Grade: [$score/3]"
