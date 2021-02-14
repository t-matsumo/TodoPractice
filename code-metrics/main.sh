countOfFile=$(find .. -regex '.*.swift' | wc -l | sed 's/^ *\| *$//')
countOfTestFile=$(find .. -regex '.*Test.swift' | wc -l | sed 's/^ *\| *$//')
linesOfCode=$(find .. -regex '.*.swift' | xargs wc -l | tail -n 1 | awk '{ print $1 }')
linesOfTestCode=$(find .. -regex '.*Test.swift' | xargs wc -l | tail -n 1 | awk '{ print $1 }')
countOfStoryBoard=$(find .. -regex '.*.storyboard' | wc -l | sed 's/^ *\| *$//')

kotlinc ./Main.kt -include-runtime -d ./Main.jar -language-version 1.3 -XXLanguage:+InlineClasses
echo $countOfStoryBoard $countOfFile $countOfTestFile $linesOfCode $linesOfTestCode | java -cp ./Main.jar MainKt
