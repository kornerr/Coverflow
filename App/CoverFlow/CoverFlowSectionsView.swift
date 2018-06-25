
import UIKit

private func COVER_FLOW_SECTIONS_VIEW_LOG(_ message: String)
{
    NSLog("CoverFlowSectionsView \(message)")
}

class CoverFlowSectionsView:
    UIView,
    UICollectionViewDataSource,
    UIGestureRecognizerDelegate
{

    // MARK: - SETUP

    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.setupCollectionView()
        self.setupSwipes()
    }

    // MARK: - ITEMS

    var items: [SectionsItem]
    {
        get
        {
            return _items
        }
        set
        {
            _items = newValue
            self.updateItems()
        }
    }
    private var _items = [SectionsItem]()

    private func updateItems()
    {
        // Display items.
        self.collectionView.reloadData()
    }

    // MARK: - COLLECTION VIEW

    @IBOutlet private var collectionView: UICollectionView!
    private var collectionViewLayout: CCoverflowCollectionViewLayout!

    private func setupCollectionView()
    {
        self.collectionView.register(Cell.self, forCellWithReuseIdentifier: CellId)
        self.collectionView.dataSource = self
        
        self.collectionViewLayout = CCoverflowCollectionViewLayout()
        self.collectionView.collectionViewLayout = self.collectionViewLayout
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return self.items.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return self.cell(forItemAt: indexPath)
    }

    // MARK: - CELL

    private let CellId = "CellId"
    private typealias CellView = CoverFlowSectionsItemView
    private typealias Cell = CBetterCollectionViewCellTemplate<CellView>

    private func cell(forItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell =
            self.collectionView.dequeueReusableCell(
                withReuseIdentifier: CellId,
                for: indexPath
            )
            as! Cell
        let item = self.items[indexPath.row]
        cell.itemView.image = item.image
        return cell
    }

    // MARK: - PRIORITIZE SWIPE OVER PAN

    private var leftSwipeGR: UISwipeGestureRecognizer!
    private var rightSwipeGR: UISwipeGestureRecognizer!

    private func setupSwipes()
    {
        // Left swipe.
        self.leftSwipeGR =
            UISwipeGestureRecognizer(
                target: self,
                action: #selector(swipeLeft(_:))
            )
        self.leftSwipeGR.direction = .left
        self.collectionView.addGestureRecognizer(self.leftSwipeGR)

        // Right swipe.
        self.rightSwipeGR =
            UISwipeGestureRecognizer(
                target: self,
                action: #selector(swipeRight(_:))
            )
        self.rightSwipeGR.direction = .left
        self.collectionView.addGestureRecognizer(self.rightSwipeGR)

        //self.collectionView.panGestureRecognizer.delegate = self
    }

    @objc func swipeLeft(_ gesture: UISwipeGestureRecognizer)
    {
        COVER_FLOW_SECTIONS_VIEW_LOG("Swipe left")
    }

    @objc func swipeRight(_ gesture: UISwipeGestureRecognizer)
    {
        COVER_FLOW_SECTIONS_VIEW_LOG("Swipe right")
    }

    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        COVER_FLOW_SECTIONS_VIEW_LOG("pan gesture should require failure of")
        if 
            otherGestureRecognizer == self.leftSwipeGR ||
            otherGestureRecognizer == self.rightSwipeGR
        {
            COVER_FLOW_SECTIONS_VIEW_LOG("left/right swipe failed")
            return true
        }
        COVER_FLOW_SECTIONS_VIEW_LOG("left/right swipe did not fail")
        return false
    }
}

