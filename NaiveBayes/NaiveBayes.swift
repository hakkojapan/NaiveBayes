//
//  NaiveBayes.swift
//  NaiveBayes
//
//  Created by hakozaki on 2016/05/26.
//  Copyright © 2016年 hakozaki. All rights reserved.
//

import Foundation

public class NaiveBayes:NSObject{
    
    var categoryCount : [String:Int] = [:]
    var wordCount : [[String:Int]] = []
    var denominator : [String:Double] = [:]
    var label : [String:Int] = [:]
    var checkNumber : Int = 0
    var totalCategory : Int = 0
    
    public func start(){
        print("NaiveBayes yattaa..")
    }
    public func train(array : [(category:String,word:Array<String>)]){
        for d in array{
            let category = d.category
            let wordDict = d.word
            var element = Dictionary<String,Int>()
            
            if((categoryCount[category]) != nil) {
                categoryCount[category]! += 1
                
                for w in wordDict {
                    if(wordCount[label[category]!][w] != nil){
                        wordCount[label[category]!][w]! += 1
                    }else{
                        wordCount[label[category]!][w] = 1
                    }
                }
            } else {
                categoryCount[category] = 1
                label[category] = checkNumber
                checkNumber += 1
                
                for w in wordDict {
                    element[w] = 1
                }
                wordCount.append(element)
            }
        }
        for (key,_) in categoryCount {
            var s = 0
            for (_,length) in wordCount[label[key]!]{
                s += length
            }
            denominator[key] = Double(wordCount[label[key]!].count) + Double(s)
        }
        for (_,length) in categoryCount {
            totalCategory += length
        }
    }
    
    public func category_probability(){
        for (key,length) in categoryCount {
            print( "\(key) =  \((Double(length) / Double(totalCategory))) ")
        }
    }
    
    public func word_probability(word : String , category : String) -> Double{
        if(wordCount[label[category]!][word] != nil){
            return (Double(wordCount[label[category]!][word]!) + 1.0 ) / (denominator[category]!)
        }else{
            return ( 1.0 / (denominator[category]!) )
        }
    }
    
    public func getScore(wordArray : [String] , category : String) -> Double{
        var score = Double(categoryCount[category]!) / Double(totalCategory)
        for word in wordArray {
            score *= word_probability(word, category: category)
        }
        return score
    }
    
    public func classify(wordArray : [String]) -> String{
        var max = 0.0
        var category : String = ""
        for (key,_) in categoryCount{
            let value = getScore(wordArray, category: key)
            if value > max{
                max = value
                category = key
            }
        }
        return category
    }

}