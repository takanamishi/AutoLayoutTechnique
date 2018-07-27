import UIKit

extension UIView {
    func initFromNib() {
        let bundle = Bundle(for: type(of: self))
        let className = String(describing: type(of: self))
        let nib = UINib(nibName: className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        // カスタムViewのサイズを自分自身と同じサイズにする
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                                      metrics:nil,
                                                                      views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                                      metrics:nil,
                                                                      views: bindings))
    }
}
