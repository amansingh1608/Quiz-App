
//  Question.swift
//  Quizzler
//
//  Created by Aman singh on 31/03/19.



import Foundation

class Question{
    let questionText : String
    let answer : Bool
    
    //constructor
    init(text:String,correctAnswer:Bool){
        questionText=text
        answer=correctAnswer
    }
}
