# NaiveBayes
NaiveBayes is Naive Bayes Classifier in Swift for iOS and Mac.  
This is based on Bayes's theorem and is useful to text classification, etc.  
I used Laplace Smoothing in order to avoid zero frequency problem.   

## Installation

``` sh
pod 'NaiveBayes', :git => 'https://github.com/hakkojapan/NaiveBayes.git'
```
When you install this , you may need to add `use_frameworks!` to your podfile. 

##Usage

please see example.  

``` swift
let data = [("sport",["football","messi","ronaldo","football"]),
("sport",["CL","Real Madrid","Atletico Madrid"]),
("sport",["tennis","basketball","baseball","nishikori"]),
("IT",["Apple","iPhone","iPad","Apple TV"]),
("IT",["Facebook","Google","DeepLearning","Twitter"]),
("science",["oxygen","biology","IPS cells","atom"]),
("science",["mathmatic","phisic","fourier","NASA"])
] as [(category:String, word:Array<String>)]


let test = ["football","ronaldo","Real Madrid","bale","Twitter"]

let nb = NaiveBayes()
nb.train(data)
nb.category_probability()
print("P(football|sport) = \(nb.word_probability("football", category: "sport"))")
print("P(football|IT) = \(nb.word_probability("football", category: "IT"))")
print("P(football|science) = \(nb.word_probability("football", category: "science"))")
print("Score(football|sport) = \(nb.getScore(test, category:"sport"))")
print("Score(football|IT) = \(nb.getScore(test, category:"IT"))")
print("Score(football|science) = \(nb.getScore(test, category:"science"))")
print(nb.classify(test))
```

## License

MIT
