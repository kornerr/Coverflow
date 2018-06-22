
import UIKit

class CoverFlowCoordinator: Coordinator
{

    // MARK: - SETUP

    override init()
    {
        super.init()
        self.setupCoverFlow()
    }

    // MARK: - COVER FLOW

    private var sectionsView: CoverFlowSectionsView!

    private func setupCoverFlow()
    {
        self.sectionsView = UIView.loadFromNib()
        let vc = UIViewControllerTemplate(mainView: self.sectionsView)
        vc.title = NSLocalizedString("CoverFlow.Title", comment: "")

        self.setupSectionItems()

        self.rootVC = vc
    }

    private func setupSectionItems()
    {
        // Use MassEffect races as sections: http://masseffect.wikia.com/wiki/Races
        self.sectionsView.items = [
            SectionsItem(
                "Asari",
                UIImage(named: "race.asari.png")!
            ),
            SectionsItem(
                "Drell",
                UIImage(named: "race.drell.png")!
            ),
            SectionsItem(
                "Elcor",
                UIImage(named: "race.elcor.png")!
            ),
            SectionsItem(
                "Hanar",
                UIImage(named: "race.hanar.png")!
            ),
            SectionsItem(
                "Humans",
                UIImage(named: "race.humans.jpg")!
            ),
            SectionsItem(
                "Keepers",
                UIImage(named: "race.keeper.png")!
            ),
            SectionsItem(
                "Salarians",
                UIImage(named: "race.salarians.png")!
            ),
            SectionsItem(
                "Turians",
                UIImage(named: "race.turians.png")!
            ),
            SectionsItem(
                "Volus",
                UIImage(named: "race.volus.png")!
            ),
        ]
        // TODO Set images later through DispatchQueue to simulate their loading.
    }

}

