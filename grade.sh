# Create your grading script here

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'




javac TestListExamples.java

if [ $? != 00 ]
then
  echo "Missing Files! You need to do better than this! There is just one file
  to be submitted and u messed up! Major disappointment!"
  exit 1
fi

echo "U got all the files, good work, young man! But you would probably fail as well
so drop this class right now!"

if <-e ListExamples.java>
then

cp list-examples-grader

mv 