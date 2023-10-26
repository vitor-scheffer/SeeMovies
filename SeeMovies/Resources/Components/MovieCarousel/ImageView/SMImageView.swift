import UIKit

public final class SMImageView: UIView {
    private let imageView = UIImageView()
    private let labelTitle = SMLabel(.bold14)
    private let labelDescription = SMLabel(.caption)
    private let dataSource: SMImageViewDataSource

    public init(dataSource: SMImageViewDataSource) {
        self.dataSource = dataSource

        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) { return nil }

    public override func didMoveToSuperview() {
        imageView.setSize(width: 112, height: 104)
        imageView.contentMode = .center

        imageView.setImage(dataSource.image)
        labelTitle.text = dataSource.title
        labelDescription.text = dataSource.description

        addSubviews([imageView, labelTitle, labelDescription], constraints: true)
        
        imageView.smc
            .top()
            .centerX()
        
        labelTitle.smc
            .top(imageView.bottomAnchor, 8)
            .centerX()
        
        labelDescription.smc
            .top(labelTitle.bottomAnchor, 4)
            .centerX()
    }
}

public struct SMImageViewDataSource: Equatable {
    let image: UIImage
    let title: String
    let description: String?

    public init(
        image: UIImage,
        title: String,
        description: String? = nil
    ) {
        self.image = image
        self.title = title
        self.description = description
    }
}
