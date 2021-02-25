//
//  ViewController.swift
//  HomeWork2.9
//
//  Created by Admin on 25.02.2021.
//

import Spring

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var springView: SpringView!
    @IBOutlet var runButton: SpringButton!
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var animationPropertyLabel: UIStackView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    
    //MARK: - Private property
    let animation = Spring.AnimationPreset.allCases
    let curve = Spring.AnimationCurve.allCases
    var ani = Animation.getAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLabel.isHidden = false
        animationPropertyLabel.isHidden = true
    }
    
    //MARK: - IBActions
    @IBAction func runButtonPressed(_ sender: SpringButton) {
        if animationPropertyLabel.isHidden {
            startLabel.isHidden.toggle()
            animationPropertyLabel.isHidden.toggle()
            getModelProperty()
            springViewProperty()
            runButtonProperty()
        } else {
            springViewProperty()
            runButtonProperty()
        }
    }
}

//MARK: - Extansions
extension ViewController {
    func springViewProperty() {
        springView.animation = ani.title
        springView.curve = ani.curve
        springView.duration = CGFloat(ani.duration)
        springView.delay = CGFloat(ani.delay)
        springView.force = CGFloat(ani.force)
        
        textLabelProperty()
        
        springView.animate()
    }
}

extension ViewController {
    func runButtonProperty() {
        getModelProperty()
        runButton.animation = Spring.AnimationPreset.pop.rawValue
        runButton.curve = ani.curve
        runButton.duration = CGFloat(ani.duration)
        runButton.delay = CGFloat(ani.delay)
        runButton.force = CGFloat(ani.force)
        runButton.setTitle("Run animate view " + ani.title, for: .normal)
        
        runButton.animate()
    }
}

//MARK: - TextLablel property
extension ViewController {
    func textLabelProperty() {
        titleLabel.text = ani.title
        curveLabel.text = ani.curve
        durationLabel.text = String(format: "%.2f", ani.duration)
        delayLabel.text = String(format: "%.2f", ani.delay)
        forceLabel.text = String(format: "%.2f", ani.force)
    }
}

//MARK: - Work with model
extension ViewController {
    func getModelProperty() {
        let IndexAni = Int.random(in: 0..<animation.count)
        let IndexCur = Int.random(in: 0..<curve.count)
        ani.title = animation[IndexAni].rawValue
        ani.curve = curve[IndexCur].rawValue
    }
}


