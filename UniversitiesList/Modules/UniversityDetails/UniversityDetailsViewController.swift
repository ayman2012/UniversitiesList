//
//  UniversityDetailsViewController.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import UIKit

// MARK: - UniversityDetailsViewController Class
class UniversityDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityCountryLabel: UILabel!
    @IBOutlet weak var universityCountryCodeLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    @IBOutlet weak var universityWebPageTextView: UITextView!
    
    // MARK: - Proprieties
    var presenter: UniversityDetailsPresenterProtocol
    
    // MARK: - Initialization
    init(presenter: UniversityDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "University Details"
        presenter.viewDidLoad()
        setupTextView()
    }
    
    // MARK: - Utilities Methods
    private func setupTextView() {
        universityWebPageTextView.isEditable = false
        universityWebPageTextView.isUserInteractionEnabled = true
        universityWebPageTextView.delegate = self
    }
    
    @IBAction func refreshTapedAction(_ sender: Any) {
        presenter.refreshData() 
    }
    
    private func setUpWebPageLink(link: String) {
        let attributedString = NSMutableAttributedString(string: link)
        guard let url = URL(string: link) else { return }
        attributedString.setAttributes([.link: url], range: NSMakeRange(0, link.count))
        universityWebPageTextView.attributedText = attributedString
        universityWebPageTextView.linkTextAttributes = [
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
}

// MARK: - UniversityDetailsViewProtocol Extension
extension UniversityDetailsViewController: UniversityDetailsViewProtocol {
    func updateUI() {
        universityNameLabel.text = presenter.getUniversityName()
        universityCountryLabel.text = presenter.getUniversityCountry()
        universityCountryCodeLabel.text = presenter.getUniversityCountryCode()
        universityStateLabel.text = presenter.getUniversityState()
        setUpWebPageLink(link: presenter.getUniversityWebPage())
    }
    
    func dismissUniversityDetails() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITextViewDelegate Extension
extension UniversityDetailsViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(URL)
        }
        return false
    }
}
