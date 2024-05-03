//
//  UniversityDetailsViewController.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import UIKit

class UniversityDetailsViewController: UIViewController {
    
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityCountryLabel: UILabel!
    @IBOutlet weak var universityCountryCodeLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    @IBOutlet weak var universityWebPageTextView: UITextView!
    @IBOutlet weak var universityRefreshButton: UIButton!
    
    var presenter: UniversityDetailsPresenterProtocol
    
    init(presenter: UniversityDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupTextView()
    }
    
    private func setupTextView() {
        universityWebPageTextView.isEditable = false
        universityWebPageTextView.isUserInteractionEnabled = true
        universityWebPageTextView.delegate = self
    }
    
    private func setUpWebPageLink(link: String) {
        // TODO: - To Localize the string here
        let attributedString = NSMutableAttributedString(string: "Just click here to visit the webPage")
        guard let url = URL(string: link) else { return }
        attributedString.setAttributes([.link: url], range: NSMakeRange(5, 10))
        universityWebPageTextView.attributedText = attributedString
        universityWebPageTextView.linkTextAttributes = [
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
}

extension UniversityDetailsViewController: UniversityDetailsViewProtocol {
    func updateUI() {
        universityNameLabel.text = presenter.getUniversityName()
        universityCountryLabel.text = presenter.getUniversityCountry()
        universityCountryCodeLabel.text = presenter.getUniversityCountryCode()
        universityStateLabel.text = presenter.getUniversityState()
        setUpWebPageLink(link: presenter.getUniversityWebPage())
    }
}

extension UniversityDetailsViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        UIApplication.shared.openURL(URL)
        return false
    }
}
