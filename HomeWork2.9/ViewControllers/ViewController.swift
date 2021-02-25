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
    var animations = Animation.getAnimation()
    
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
        springView.animation = animations.title
        springView.curve = animations.curve
        springView.duration = CGFloat(animations.duration)
        springView.delay = CGFloat(animations.delay)
        springView.force = CGFloat(animations.force)
        
        textLabelProperty()
        
        springView.animate()
    }
}

extension ViewController {
    func runButtonProperty() {
        getModelProperty()
        runButton.animation = Spring.AnimationPreset.pop.rawValue
        runButton.curve = animations.curve
        runButton.duration = CGFloat(animations.duration)
        runButton.delay = CGFloat(animations.delay)
        runButton.force = CGFloat(animations.force)
        runButton.setTitle("Run animate view " + animations.title, for: .normal)
        
        runButton.animate()
    }
}

//MARK: - TextLablel property
extension ViewController {
    func textLabelProperty() {
        titleLabel.text = animations.title
        curveLabel.text = animations.curve
        durationLabel.text = String(format: "%.2f", animations.duration)
        delayLabel.text = String(format: "%.2f", animations.delay)
        forceLabel.text = String(format: "%.2f", animations.force)
    }
}

//MARK: - Work with model
extension ViewController {
    func getModelProperty() {
        let IndexAni = Int.random(in: 0..<animation.count)
        let IndexCur = Int.random(in: 0..<curve.count)
        animations.title = animation[IndexAni].rawValue
        animations.curve = curve[IndexCur].rawValue
    }
}


