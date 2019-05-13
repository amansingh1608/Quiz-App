//
//  ViewController.swift
//  Quizzler
//


import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions=QuestionBank()
    var pickedAnswer=false
    var questionNumber=0
    var score=0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion=allQuestions.list[0]
        questionLabel.text=firstQuestion.questionText
       
    }
   
    
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag==1{
            pickedAnswer=true
        }
        if sender.tag==2{
            pickedAnswer=false
        }
        checkAnswer()
        questionNumber+=1
        
        
        nextQuestion()
       
    }
    
    
    
    func updateUI() {
        scoreLabel.text="Score:\(score)"
        progressLabel.text="\(questionNumber+1)/13"
        progressBar.frame.size.width=(view.frame.size.width/13)*CGFloat(questionNumber+1)
      
    }
    

    func nextQuestion() {
        if questionNumber<=12{
        questionLabel.text=allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else{
            let alert=UIAlertController(title: "Awesome", message: "Do you waana start again", preferredStyle: .alert)
            let restartAction=UIAlertAction(title: "Restart", style: .default, handler:{(UIAlertAction) in self.startOver()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            }
        }
    

    
    func checkAnswer() {
        
        let correctAnswer=allQuestions.list[questionNumber].answer
        if correctAnswer==pickedAnswer{
            ProgressHUD.showSuccess("Correct")
            //print("correct")
            score+=1
        }
        else {
            ProgressHUD.showError("wrong")
               // print("wrong")
            }
        }
        
   
    
    func startOver() {
        questionNumber=0
        score=0
        
        nextQuestion()
       
    }
}
    

    

