//
//  ViewController.swift
//  Quiz04
//
//  Created by Kenny on 2022/06/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSubject: UILabel! // 과목이름
    @IBOutlet weak var tfScore: UITextField! // 과목 점수
    
    @IBOutlet weak var lblTotal: UILabel! // 총점
    @IBOutlet weak var lblAverage: UILabel! // 평균
    @IBOutlet weak var lblKorean: UILabel! // 국어점수
    @IBOutlet weak var lblEnglish: UILabel! // 영어점수
    @IBOutlet weak var lblMathematics: UILabel! // 수학점수
    
    @IBOutlet weak var lblMessage: UILabel!
    
    var subjectCount = 0 // 과목별 순서
    var score:[Int] = [0,0,0]
    var subjectTitle: [String] = ["국어점수", "영어점수", "수학점수", "요약"]
    var averageStore: Double = 0 // 평균값 저장
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSubject.text = subjectTitle[subjectCount]
        lblTotal.text = ""
        lblAverage.text = ""
        lblKorean.text = ""
        lblEnglish.text = ""
        lblMathematics.text = ""
        lblMessage.text = ""
    }

    @IBAction func btnCalculation(_ sender: UIButton) {
        subjectCount+=1
        switch subjectCount{
        case 1: // 영어 점수 화면 준비, 국어 점수 계산
            let numCheck = checkNil(str: tfScore.text!)
            if numCheck == 1{
                lblSubject.text = subjectTitle[subjectCount]
                score[0] = Int(tfScore.text!)!
                tfScore.text = ""
                lblMessage.text = ""
            }else{
                subjectCount -= 1
                lblMessage.text = "숫자를 입력하세요!"
            }
            
        case 2: // 수학점수 화면 준비, 영어 점수 계산
            let numCheck = checkNil(str: tfScore.text!)
            if numCheck == 1{
                lblSubject.text = subjectTitle[subjectCount]
                score[1] = Int(tfScore.text!)!
                tfScore.text = ""
                lblMessage.text = ""
            }else{
                subjectCount -= 1
                lblMessage.text = "숫자를 입력하세요!"
            }
        case 3: // 결과 화면 준비, 수학 점수 계산
            let numCheck = checkNil(str: tfScore.text!)
            if numCheck == 1{
                lblSubject.text = subjectTitle[subjectCount]
                score[2] = Int(tfScore.text!)!
                tfScore.isHidden = true // 점수 textfield 숨기기
                
                calcTotal_Average() // 총점과 평균계산
                summaryGrade() // 과목과 평균의 비교 출력
                tfScore.text = ""
                lblMessage.text = ""
            }else{
                subjectCount -= 1
                lblMessage.text = "숫자를 입력하세요!"
            }
        default:
            subjectCount = 0
            lblSubject.text = subjectTitle[subjectCount]
            tfScore.isHidden = false
            lblTotal.text = ""
            lblAverage.text = ""
            lblKorean.text?.removeAll()
            lblEnglish.text?.removeAll()
            lblMathematics.text?.removeAll()
            score = [0,0,0]
        }
    }
    
    func calcTotal_Average(){
        let calcFunction = calcTotal(scoreVar: score)
        lblTotal.text = "총점은 \(calcFunction.0) 입니다."
        lblAverage.text = "평균은 \(round(calcFunction.1 * 100) / 100) 입니다."
    }
    
    func calcTotal(scoreVar: Array<Int>) -> (Int, Double){
        var funcTotal: Int = 0
        for i in 0..<subjectTitle.count - 1{
            funcTotal += score[i]
        }
        let average: Double = Double(funcTotal) / 3.0
        averageStore = average
        return (funcTotal, average)
    }
    
    func summaryGrade(){
        // 국어
        if averageStore > Double(score[0]){
            lblKorean.text = "국어 점수는 \(score[0])으로 평균보다 낮습니다."
        }else if averageStore < Double(score[0]){
            lblKorean.text = "국어 점수는 \(score[0])으로 평균보다 높습니다."
        }else{
            lblKorean.text = "국어 점수는 \(score[0])으로 평균과 동일 합니다."
        }
        
        // 영어
        if averageStore > Double(score[1]){
            lblEnglish.text = "영어 점수는 \(score[1])으로 평균보다 낮습니다."
        }else if averageStore < Double(score[1]){
            lblEnglish.text = "영어 점수는 \(score[1])으로 평균보다 높습니다."
        }else{
            lblEnglish.text = "영어 점수는 \(score[1])으로 평균과 동일 합니다."
        }

        // 수학
        if averageStore > Double(score[2]){
            lblMathematics.text = "수학 점수는 \(score[2])으로 평균보다 낮습니다."
        }else if averageStore < Double(score[2]){
            lblMathematics.text = "수학 점수는 \(score[2])으로 평균보다 높습니다."
        }else{
            lblMathematics.text = "수학 점수는 \(score[2])으로 평균과 동일 합니다."
        }
        
    }
    
    func checkNil(str: String) -> Int{
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if check.isEmpty{
            return 0
        }else{
            return 1
        }
    }
    
}// ViewController

