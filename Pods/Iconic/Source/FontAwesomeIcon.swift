// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

/** A wrapper class for Objective-C compatibility. */
public extension Iconic {

    /** The icon font's family name. */
    @objc class var fontAwesomeIconFamilyName: NSString {
        return FontAwesomeIcon.familyName as NSString
    }
    /** The icon font's total count of available icons. */
    @objc class var fontAwesomeIconCount: Int {
        return FontAwesomeIcon.count
    }
    /**
     Returns the icon font object for the specified size.

     - parameter size: The size (in points) to which the font is scaled.
     */
    @objc class func fontAwesomeIconFont(ofSize size: CGFloat) -> UIFont {
        return FontAwesomeIcon.font(ofSize: size)
    }

    /**
     Returns the icon as an attributed string with the given pointSize and color.

     - parameter icon: The icon type.
     - parameter pointSize: The size of the font.
     - parameter color: The tint color of the font.
     */
    @objc class func attributedString(withIcon icon: FontAwesomeIcon, pointSize: CGFloat, color: UIColor?) -> NSAttributedString {
        return icon.attributedString(ofSize: pointSize, color: color)
    }

    /**
     Returns the icon as an attributed string with the given pointSize, color and padding.

     - parameter icon: The icon type.
     - parameter pointSize: The size of the font.
     - parameter color: The tint color of the font.
     - parameter edgeInsets: The edge insets to be used as horizontal and vertical padding.
     */
    @objc class func attributedString(withIcon icon: FontAwesomeIcon, pointSize: CGFloat, color: UIColor?, edgeInsets: UIEdgeInsets) -> NSAttributedString {
        return icon.attributedString(ofSize: pointSize, color: color, edgeInsets: edgeInsets)
    }
    /**
     Returns the icon as an image with the given size and color.

     - parameter icon: The icon type.
     - parameter size: The size of the image, in points.
     - parameter color: A tint color for the image.
     */
    @objc class func image(withIcon icon: FontAwesomeIcon, size: CGSize, color: UIColor?) -> UIImage {
        return icon.image(ofSize: size, color: color)
    }

    /**
     Returns the icon as an image with the given size and color.

     - parameter icon: The icon type.
     - parameter size: The size of the image, in points.
     - parameter color: The tint color of the image.
     - parameter edgeInsets: The edge insets to be used as padding values.
     */
    @objc class func image(withIcon icon: FontAwesomeIcon, size: CGSize, color: UIColor?, edgeInsets: UIEdgeInsets) -> UIImage {
        return icon.image(ofSize: size, color: color, edgeInsets: edgeInsets)
    }

    /**
     Registers the icon font with the font manager.
     Note: an exception will be thrown if the resource (ttf/otf) font file is not found in the bundle.
     */
    @objc class func registerFontAwesomeIcon() {
        FontAwesomeIcon.register()
    }
    /**
     Unregisters the icon font from the font manager.
     */
    @objc class func unregisterFontAwesomeIcon() {
        FontAwesomeIcon.unregister()
    }
}

#if os(iOS) || os(tvOS)

public extension UIBarButtonItem {
    /**
     Initializes a new item using the specified icon and other properties.
     - parameter icon: The icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.
     */
    convenience init(withIcon icon: FontAwesomeIcon, size: CGSize, target: AnyObject?, action: Selector) {
        let image = icon.image(ofSize: size, color: .black)
        self.init(image: image, style: .plain, target: target, action: action)
    }
}

public extension UITabBarItem {
    /**
     Initializes a new item using the specified icon and other properties.
     The tag is automatically assigned using the icon's raw integer value.
     - parameter icon: The icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter title: The item's title. If nil, a title is not displayed.
     */
    convenience init(withIcon icon: FontAwesomeIcon, size: CGSize, title: String?) {
        let image = icon.image(ofSize: size, color: .black)
        self.init(title: title, image: image, tag: icon.rawValue)
    }
}

public extension UIButton {
    /**
     Sets the icon to use for the specified state.
     - parameter icon: The icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image.
     - parameter state: The state that uses the specified title. The values are described in UIControlState.
     */
    func setIconImage(withIcon icon: FontAwesomeIcon, size: CGSize, color: UIColor?, forState state: UIControlState) {
        let image = icon.image(ofSize: size, color: color ?? .black)
        setImage(image, for: state)
    }
}

#endif

/** A list with available icon glyphs from the icon font. */
@objc public enum FontAwesomeIcon: Int {
    case _279
    case _283
    case _303
    case _312
    case _317
    case _329
    case _334
    case _335
    case _366
    case _372
    case _374
    case _376
    case _378
    case _380
    case _382
    case _383
    case _384
    case _385
    case _386
    case _387
    case _388
    case _389
    case _392
    case _393
    case _395
    case _396
    case _397
    case _398
    case _399
    case _400
    case _402
    case _403
    case _404
    case _406
    case _407
    case _408
    case _409
    case _410
    case _411
    case _412
    case _413
    case _414
    case _415
    case _416
    case _417
    case _418
    case _419
    case _422
    case _423
    case _424
    case _425
    case _426
    case _427
    case _428
    case _429
    case _430
    case _431
    case _432
    case _433
    case _434
    case _438
    case _439
    case _443
    case _444
    case _445
    case _446
    case _447
    case _448
    case _449
    case _451
    case _452
    case _453
    case _454
    case _455
    case _456
    case _457
    case _458
    case _459
    case _460
    case _461
    case _462
    case _463
    case _464
    case _466
    case _467
    case _469
    case _470
    case _471
    case _472
    case _473
    case _474
    case _475
    case _476
    case _478
    case _479
    case _480
    case _481
    case _482
    case _483
    case _484
    case _485
    case _486
    case _487
    case _488
    case _489
    case _490
    case _491
    case _492
    case _493
    case _494
    case _496
    case _498
    case _499
    case _500
    case _501
    case _502
    case _503
    case _504
    case _505
    case _506
    case _507
    case _508
    case _509
    case _511
    case _512
    case _513
    case _514
    case _515
    case _516
    case _517
    case _518
    case _519
    case _520
    case _521
    case _522
    case _523
    case _524
    case _525
    case _526
    case _527
    case _528
    case _529
    case _530
    case _531
    case _532
    case _533
    case _534
    case _535
    case _536
    case _537
    case _538
    case _539
    case _540
    case _541
    case _542
    case _543
    case _544
    case _545
    case _546
    case _547
    case _548
    case _549
    case _550
    case _551
    case _552
    case _553
    case _554
    case _555
    case _556
    case _557
    case _558
    case _559
    case _560
    case _561
    case _562
    case _563
    case _564
    case _565
    case _566
    case _567
    case _568
    case _569
    case _572
    case _574
    case _575
    case _576
    case _577
    case _578
    case _579
    case _580
    case _581
    case _582
    case _583
    case _584
    case _585
    case _586
    case _587
    case _588
    case _589
    case _590
    case _591
    case _592
    case _593
    case _594
    case _595
    case _596
    case _597
    case _598
    case _602
    case _603
    case _604
    case _607
    case _608
    case _609
    case _610
    case _611
    case _612
    case _613
    case _614
    case _615
    case _616
    case _617
    case _618
    case _619
    case _620
    case _621
    case _622
    case _623
    case _624
    case _625
    case _626
    case _627
    case _628
    case _629
    case Adjust
    case Adn
    case AlignCenter
    case AlignJustify
    case AlignLeft
    case AlignRight
    case Ambulance
    case Anchor
    case Android
    case AngleDown
    case AngleLeft
    case AngleRight
    case AngleUp
    case Apple
    case Archive
    case ArrowCircleAltLeft
    case ArrowDown
    case ArrowLeft
    case ArrowRight
    case ArrowUp
    case Asterisk
    case Backward
    case BanCircle
    case BarChart
    case Barcode
    case Beaker
    case Beer
    case Bell
    case BellAlt
    case BitbucketSign
    case Bold
    case Bolt
    case Book
    case Bookmark
    case BookmarkEmpty
    case Briefcase
    case Btc
    case Bug
    case Building
    case Bullhorn
    case Bullseye
    case Calendar
    case CalendarEmpty
    case Camera
    case CameraRetro
    case CaretDown
    case CaretLeft
    case CaretRight
    case CaretUp
    case Certificate
    case Check
    case CheckEmpty
    case CheckMinus
    case CheckSign
    case ChevronDown
    case ChevronLeft
    case ChevronRight
    case ChevronSignDown
    case ChevronSignLeft
    case ChevronSignRight
    case ChevronSignUp
    case ChevronUp
    case Circle
    case CircleArrowDown
    case CircleArrowLeft
    case CircleArrowRight
    case CircleArrowUp
    case CircleBlank
    case Cloud
    case CloudDownload
    case CloudUpload
    case Code
    case CodeFork
    case Coffee
    case Cog
    case Cogs
    case Collapse
    case CollapseAlt
    case CollapseTop
    case Columns
    case Comment
    case CommentAlt
    case Comments
    case CommentsAlt
    case Compass
    case Copy
    case CreditCard
    case Crop
    case Css3
    case Cut
    case Dashboard
    case Desktop
    case DotCircleAlt
    case DoubleAngleDown
    case DoubleAngleLeft
    case DoubleAngleRight
    case DoubleAngleUp
    case Download
    case DownloadAlt
    case Dribble
    case Dropbox
    case Edit
    case EditSign
    case Eject
    case EllipsisHorizontal
    case EllipsisVertical
    case Envelope
    case EnvelopeAlt
    case Eur
    case Exchange
    case Exclamation
    case ExclamationSign
    case ExpandAlt
    case ExternalLink
    case EyeClose
    case EyeOpen
    case F0fe
    case F171
    case F1a1
    case F1a4
    case F1ab
    case F1f3
    case F1fc
    case F210
    case F212
    case F260
    case F261
    case F263
    case F27e
    case Facebook
    case FacebookSign
    case FacetimeVideo
    case FastBackward
    case FastForward
    case Female
    case FighterJet
    case File
    case FileAlt
    case FileText
    case FileTextAlt
    case Film
    case Filter
    case Fire
    case FireExtinguisher
    case Flag
    case FlagAlt
    case FlagCheckered
    case Flickr
    case FolderClose
    case FolderCloseAlt
    case FolderOpen
    case FolderOpenAlt
    case Font
    case Food
    case Forward
    case Foursquare
    case Frown
    case Fullscreen
    case Gamepad
    case Gbp
    case Gift
    case Github
    case GithubAlt
    case GithubSign
    case Gittip
    case Glass
    case Globe
    case GooglePlus
    case GooglePlusSign
    case Group
    case HSign
    case HandDown
    case HandLeft
    case HandRight
    case HandUp
    case Hdd
    case Headphones
    case Heart
    case HeartEmpty
    case Home
    case Hospital
    case Html5
    case Inbox
    case IndentLeft
    case IndentRight
    case InfoSign
    case Inr
    case Instagram
    case Italic
    case Jpy
    case Key
    case Keyboard
    case Krw
    case Laptop
    case Leaf
    case Legal
    case Lemon
    case Lessequal
    case LevelDown
    case LevelUp
    case LightBulb
    case Link
    case Linkedin
    case LinkedinSign
    case Linux
    case List
    case ListAlt
    case LocationArrow
    case Lock
    case LongArrowDown
    case LongArrowLeft
    case LongArrowRight
    case LongArrowUp
    case Magic
    case Magnet
    case Male
    case MapMarker
    case Maxcdn
    case Medkit
    case Meh
    case Microphone
    case MicrophoneOff
    case Minus
    case MinusSign
    case MinusSignAlt
    case MobilePhone
    case Money
    case Move
    case Music
    case Off
    case Ok
    case OkCircle
    case OkSign
    case Ol
    case PaperClip
    case Paste
    case Pause
    case Pencil
    case Phone
    case PhoneSign
    case Picture
    case Pinterest
    case PinterestSign
    case Plane
    case Play
    case PlayCircle
    case PlaySign
    case Plus
    case PlusSign
    case PlusSquareO
    case Print
    case Pushpin
    case PuzzlePiece
    case Qrcode
    case Question
    case QuestionSign
    case QuoteLeft
    case QuoteRight
    case Random
    case Refresh
    case Remove
    case RemoveCircle
    case RemoveSign
    case Renren
    case Reorder
    case Repeat
    case Reply
    case ReplyAll
    case ResizeFull
    case ResizeHorizontal
    case ResizeSmall
    case ResizeVertical
    case Retweet
    case Road
    case Rocket
    case Rss
    case Rub
    case Save
    case Screenshot
    case Search
    case Share
    case ShareAlt
    case ShareSign
    case Shield
    case ShoppingCart
    case SignBlank
    case Signal
    case Signin
    case Signout
    case Sitemap
    case Skype
    case Smile
    case Sort
    case SortByAlphabet
    case SortByAttributes
    case SortByAttributesAlt
    case SortByOrder
    case SortByOrderAlt
    case SortDown
    case SortUp
    case Spinner
    case StackExchange
    case Stackexchange
    case Star
    case StarEmpty
    case StarHalf
    case StarHalfEmpty
    case StepBackward
    case StepForward
    case Stethoscope
    case Stop
    case Strikethrough
    case Subscript
    case Suitcase
    case Sun
    case Superscript
    case Table
    case Tablet
    case Tag
    case Tags
    case Tasks
    case Terminal
    case TextHeight
    case TextWidth
    case Th
    case ThLarge
    case ThList
    case ThumbsDownAlt
    case ThumbsUpAlt
    case Ticket
    case Time
    case Tint
    case Trash
    case Trello
    case Trophy
    case Truck
    case Tumblr
    case TumblrSign
    case Twitter
    case TwitterSign
    case Ul
    case Umbrella
    case Underline
    case Undo
    case UniF1A0
    case UniF1B1
    case UniF1C0
    case UniF1C1
    case UniF1D0
    case UniF1D1
    case UniF1D2
    case UniF1D5
    case UniF1D6
    case UniF1D7
    case UniF1E0
    case UniF1F0
    case UniF280
    case UniF281
    case UniF285
    case UniF286
    case UniF2A0
    case UniF2A1
    case UniF2A2
    case UniF2A3
    case UniF2A4
    case UniF2A5
    case UniF2A6
    case UniF2A7
    case UniF2A8
    case UniF2A9
    case UniF2AA
    case UniF2AB
    case UniF2AC
    case UniF2AD
    case UniF2AE
    case UniF2B0
    case UniF2B1
    case UniF2B2
    case UniF2B3
    case UniF2B4
    case UniF2B5
    case UniF2B6
    case UniF2B7
    case UniF2B8
    case UniF2B9
    case UniF2BA
    case UniF2BB
    case UniF2BC
    case UniF2BD
    case UniF2BE
    case Unlink
    case Unlock
    case UnlockAlt
    case Upload
    case UploadAlt
    case Usd
    case User
    case UserMd
    case Venus
    case VimeoSquare
    case Vk
    case VolumeDown
    case VolumeOff
    case VolumeUp
    case WarningSign
    case Weibo
    case Windows
    case Wrench
    case Xing
    case XingSign
    case Youtube
    case YoutubePlay
    case YoutubeSign
    case ZoomIn
    case ZoomOut

    /** The icon font's total count of available icons. */
    public static var count: Int { return 649 }
}

extension FontAwesomeIcon : IconDrawable {
    /** The icon font's family name. */
    public static var familyName: String {
        return "FontAwesome"
    }
    /**
     Creates a new instance with the specified icon name.
     If there is no valid name is recognised, this initializer falls back to the first available icon.
     - parameter iconName: The icon name to use for the new instance.
     */
    public init(named iconName: String) {
        switch iconName.lowercased() {
        case "_279": self = ._279
        case "_283": self = ._283
        case "_303": self = ._303
        case "_312": self = ._312
        case "_317": self = ._317
        case "_329": self = ._329
        case "_334": self = ._334
        case "_335": self = ._335
        case "_366": self = ._366
        case "_372": self = ._372
        case "_374": self = ._374
        case "_376": self = ._376
        case "_378": self = ._378
        case "_380": self = ._380
        case "_382": self = ._382
        case "_383": self = ._383
        case "_384": self = ._384
        case "_385": self = ._385
        case "_386": self = ._386
        case "_387": self = ._387
        case "_388": self = ._388
        case "_389": self = ._389
        case "_392": self = ._392
        case "_393": self = ._393
        case "_395": self = ._395
        case "_396": self = ._396
        case "_397": self = ._397
        case "_398": self = ._398
        case "_399": self = ._399
        case "_400": self = ._400
        case "_402": self = ._402
        case "_403": self = ._403
        case "_404": self = ._404
        case "_406": self = ._406
        case "_407": self = ._407
        case "_408": self = ._408
        case "_409": self = ._409
        case "_410": self = ._410
        case "_411": self = ._411
        case "_412": self = ._412
        case "_413": self = ._413
        case "_414": self = ._414
        case "_415": self = ._415
        case "_416": self = ._416
        case "_417": self = ._417
        case "_418": self = ._418
        case "_419": self = ._419
        case "_422": self = ._422
        case "_423": self = ._423
        case "_424": self = ._424
        case "_425": self = ._425
        case "_426": self = ._426
        case "_427": self = ._427
        case "_428": self = ._428
        case "_429": self = ._429
        case "_430": self = ._430
        case "_431": self = ._431
        case "_432": self = ._432
        case "_433": self = ._433
        case "_434": self = ._434
        case "_438": self = ._438
        case "_439": self = ._439
        case "_443": self = ._443
        case "_444": self = ._444
        case "_445": self = ._445
        case "_446": self = ._446
        case "_447": self = ._447
        case "_448": self = ._448
        case "_449": self = ._449
        case "_451": self = ._451
        case "_452": self = ._452
        case "_453": self = ._453
        case "_454": self = ._454
        case "_455": self = ._455
        case "_456": self = ._456
        case "_457": self = ._457
        case "_458": self = ._458
        case "_459": self = ._459
        case "_460": self = ._460
        case "_461": self = ._461
        case "_462": self = ._462
        case "_463": self = ._463
        case "_464": self = ._464
        case "_466": self = ._466
        case "_467": self = ._467
        case "_469": self = ._469
        case "_470": self = ._470
        case "_471": self = ._471
        case "_472": self = ._472
        case "_473": self = ._473
        case "_474": self = ._474
        case "_475": self = ._475
        case "_476": self = ._476
        case "_478": self = ._478
        case "_479": self = ._479
        case "_480": self = ._480
        case "_481": self = ._481
        case "_482": self = ._482
        case "_483": self = ._483
        case "_484": self = ._484
        case "_485": self = ._485
        case "_486": self = ._486
        case "_487": self = ._487
        case "_488": self = ._488
        case "_489": self = ._489
        case "_490": self = ._490
        case "_491": self = ._491
        case "_492": self = ._492
        case "_493": self = ._493
        case "_494": self = ._494
        case "_496": self = ._496
        case "_498": self = ._498
        case "_499": self = ._499
        case "_500": self = ._500
        case "_501": self = ._501
        case "_502": self = ._502
        case "_503": self = ._503
        case "_504": self = ._504
        case "_505": self = ._505
        case "_506": self = ._506
        case "_507": self = ._507
        case "_508": self = ._508
        case "_509": self = ._509
        case "_511": self = ._511
        case "_512": self = ._512
        case "_513": self = ._513
        case "_514": self = ._514
        case "_515": self = ._515
        case "_516": self = ._516
        case "_517": self = ._517
        case "_518": self = ._518
        case "_519": self = ._519
        case "_520": self = ._520
        case "_521": self = ._521
        case "_522": self = ._522
        case "_523": self = ._523
        case "_524": self = ._524
        case "_525": self = ._525
        case "_526": self = ._526
        case "_527": self = ._527
        case "_528": self = ._528
        case "_529": self = ._529
        case "_530": self = ._530
        case "_531": self = ._531
        case "_532": self = ._532
        case "_533": self = ._533
        case "_534": self = ._534
        case "_535": self = ._535
        case "_536": self = ._536
        case "_537": self = ._537
        case "_538": self = ._538
        case "_539": self = ._539
        case "_540": self = ._540
        case "_541": self = ._541
        case "_542": self = ._542
        case "_543": self = ._543
        case "_544": self = ._544
        case "_545": self = ._545
        case "_546": self = ._546
        case "_547": self = ._547
        case "_548": self = ._548
        case "_549": self = ._549
        case "_550": self = ._550
        case "_551": self = ._551
        case "_552": self = ._552
        case "_553": self = ._553
        case "_554": self = ._554
        case "_555": self = ._555
        case "_556": self = ._556
        case "_557": self = ._557
        case "_558": self = ._558
        case "_559": self = ._559
        case "_560": self = ._560
        case "_561": self = ._561
        case "_562": self = ._562
        case "_563": self = ._563
        case "_564": self = ._564
        case "_565": self = ._565
        case "_566": self = ._566
        case "_567": self = ._567
        case "_568": self = ._568
        case "_569": self = ._569
        case "_572": self = ._572
        case "_574": self = ._574
        case "_575": self = ._575
        case "_576": self = ._576
        case "_577": self = ._577
        case "_578": self = ._578
        case "_579": self = ._579
        case "_580": self = ._580
        case "_581": self = ._581
        case "_582": self = ._582
        case "_583": self = ._583
        case "_584": self = ._584
        case "_585": self = ._585
        case "_586": self = ._586
        case "_587": self = ._587
        case "_588": self = ._588
        case "_589": self = ._589
        case "_590": self = ._590
        case "_591": self = ._591
        case "_592": self = ._592
        case "_593": self = ._593
        case "_594": self = ._594
        case "_595": self = ._595
        case "_596": self = ._596
        case "_597": self = ._597
        case "_598": self = ._598
        case "_602": self = ._602
        case "_603": self = ._603
        case "_604": self = ._604
        case "_607": self = ._607
        case "_608": self = ._608
        case "_609": self = ._609
        case "_610": self = ._610
        case "_611": self = ._611
        case "_612": self = ._612
        case "_613": self = ._613
        case "_614": self = ._614
        case "_615": self = ._615
        case "_616": self = ._616
        case "_617": self = ._617
        case "_618": self = ._618
        case "_619": self = ._619
        case "_620": self = ._620
        case "_621": self = ._621
        case "_622": self = ._622
        case "_623": self = ._623
        case "_624": self = ._624
        case "_625": self = ._625
        case "_626": self = ._626
        case "_627": self = ._627
        case "_628": self = ._628
        case "_629": self = ._629
        case "adjust": self = .Adjust
        case "adn": self = .Adn
        case "align_center": self = .AlignCenter
        case "align_justify": self = .AlignJustify
        case "align_left": self = .AlignLeft
        case "align_right": self = .AlignRight
        case "ambulance": self = .Ambulance
        case "anchor": self = .Anchor
        case "android": self = .Android
        case "angle_down": self = .AngleDown
        case "angle_left": self = .AngleLeft
        case "angle_right": self = .AngleRight
        case "angle_up": self = .AngleUp
        case "apple": self = .Apple
        case "archive": self = .Archive
        case "arrow_circle_alt_left": self = .ArrowCircleAltLeft
        case "arrow_down": self = .ArrowDown
        case "arrow_left": self = .ArrowLeft
        case "arrow_right": self = .ArrowRight
        case "arrow_up": self = .ArrowUp
        case "asterisk": self = .Asterisk
        case "backward": self = .Backward
        case "ban_circle": self = .BanCircle
        case "bar_chart": self = .BarChart
        case "barcode": self = .Barcode
        case "beaker": self = .Beaker
        case "beer": self = .Beer
        case "bell": self = .Bell
        case "bell_alt": self = .BellAlt
        case "bitbucket_sign": self = .BitbucketSign
        case "bold": self = .Bold
        case "bolt": self = .Bolt
        case "book": self = .Book
        case "bookmark": self = .Bookmark
        case "bookmark_empty": self = .BookmarkEmpty
        case "briefcase": self = .Briefcase
        case "btc": self = .Btc
        case "bug": self = .Bug
        case "building": self = .Building
        case "bullhorn": self = .Bullhorn
        case "bullseye": self = .Bullseye
        case "calendar": self = .Calendar
        case "calendar_empty": self = .CalendarEmpty
        case "camera": self = .Camera
        case "camera_retro": self = .CameraRetro
        case "caret_down": self = .CaretDown
        case "caret_left": self = .CaretLeft
        case "caret_right": self = .CaretRight
        case "caret_up": self = .CaretUp
        case "certificate": self = .Certificate
        case "check": self = .Check
        case "check_empty": self = .CheckEmpty
        case "check_minus": self = .CheckMinus
        case "check_sign": self = .CheckSign
        case "chevron_down": self = .ChevronDown
        case "chevron_left": self = .ChevronLeft
        case "chevron_right": self = .ChevronRight
        case "chevron_sign_down": self = .ChevronSignDown
        case "chevron_sign_left": self = .ChevronSignLeft
        case "chevron_sign_right": self = .ChevronSignRight
        case "chevron_sign_up": self = .ChevronSignUp
        case "chevron_up": self = .ChevronUp
        case "circle": self = .Circle
        case "circle_arrow_down": self = .CircleArrowDown
        case "circle_arrow_left": self = .CircleArrowLeft
        case "circle_arrow_right": self = .CircleArrowRight
        case "circle_arrow_up": self = .CircleArrowUp
        case "circle_blank": self = .CircleBlank
        case "cloud": self = .Cloud
        case "cloud_download": self = .CloudDownload
        case "cloud_upload": self = .CloudUpload
        case "code": self = .Code
        case "code_fork": self = .CodeFork
        case "coffee": self = .Coffee
        case "cog": self = .Cog
        case "cogs": self = .Cogs
        case "collapse": self = .Collapse
        case "collapse_alt": self = .CollapseAlt
        case "collapse_top": self = .CollapseTop
        case "columns": self = .Columns
        case "comment": self = .Comment
        case "comment_alt": self = .CommentAlt
        case "comments": self = .Comments
        case "comments_alt": self = .CommentsAlt
        case "compass": self = .Compass
        case "copy": self = .Copy
        case "credit_card": self = .CreditCard
        case "crop": self = .Crop
        case "css3": self = .Css3
        case "cut": self = .Cut
        case "dashboard": self = .Dashboard
        case "desktop": self = .Desktop
        case "dot_circle_alt": self = .DotCircleAlt
        case "double_angle_down": self = .DoubleAngleDown
        case "double_angle_left": self = .DoubleAngleLeft
        case "double_angle_right": self = .DoubleAngleRight
        case "double_angle_up": self = .DoubleAngleUp
        case "download": self = .Download
        case "download_alt": self = .DownloadAlt
        case "dribble": self = .Dribble
        case "dropbox": self = .Dropbox
        case "edit": self = .Edit
        case "edit_sign": self = .EditSign
        case "eject": self = .Eject
        case "ellipsis_horizontal": self = .EllipsisHorizontal
        case "ellipsis_vertical": self = .EllipsisVertical
        case "envelope": self = .Envelope
        case "envelope_alt": self = .EnvelopeAlt
        case "eur": self = .Eur
        case "exchange": self = .Exchange
        case "exclamation": self = .Exclamation
        case "exclamation_sign": self = .ExclamationSign
        case "expand_alt": self = .ExpandAlt
        case "external_link": self = .ExternalLink
        case "eye_close": self = .EyeClose
        case "eye_open": self = .EyeOpen
        case "f0fe": self = .F0fe
        case "f171": self = .F171
        case "f1a1": self = .F1a1
        case "f1a4": self = .F1a4
        case "f1ab": self = .F1ab
        case "f1f3": self = .F1f3
        case "f1fc": self = .F1fc
        case "f210": self = .F210
        case "f212": self = .F212
        case "f260": self = .F260
        case "f261": self = .F261
        case "f263": self = .F263
        case "f27e": self = .F27e
        case "facebook": self = .Facebook
        case "facebook_sign": self = .FacebookSign
        case "facetime_video": self = .FacetimeVideo
        case "fast_backward": self = .FastBackward
        case "fast_forward": self = .FastForward
        case "female": self = .Female
        case "fighter_jet": self = .FighterJet
        case "file": self = .File
        case "file_alt": self = .FileAlt
        case "file_text": self = .FileText
        case "file_text_alt": self = .FileTextAlt
        case "film": self = .Film
        case "filter": self = .Filter
        case "fire": self = .Fire
        case "fire_extinguisher": self = .FireExtinguisher
        case "flag": self = .Flag
        case "flag_alt": self = .FlagAlt
        case "flag_checkered": self = .FlagCheckered
        case "flickr": self = .Flickr
        case "folder_close": self = .FolderClose
        case "folder_close_alt": self = .FolderCloseAlt
        case "folder_open": self = .FolderOpen
        case "folder_open_alt": self = .FolderOpenAlt
        case "font": self = .Font
        case "food": self = .Food
        case "forward": self = .Forward
        case "foursquare": self = .Foursquare
        case "frown": self = .Frown
        case "fullscreen": self = .Fullscreen
        case "gamepad": self = .Gamepad
        case "gbp": self = .Gbp
        case "gift": self = .Gift
        case "github": self = .Github
        case "github_alt": self = .GithubAlt
        case "github_sign": self = .GithubSign
        case "gittip": self = .Gittip
        case "glass": self = .Glass
        case "globe": self = .Globe
        case "google_plus": self = .GooglePlus
        case "google_plus_sign": self = .GooglePlusSign
        case "group": self = .Group
        case "h_sign": self = .HSign
        case "hand_down": self = .HandDown
        case "hand_left": self = .HandLeft
        case "hand_right": self = .HandRight
        case "hand_up": self = .HandUp
        case "hdd": self = .Hdd
        case "headphones": self = .Headphones
        case "heart": self = .Heart
        case "heart_empty": self = .HeartEmpty
        case "home": self = .Home
        case "hospital": self = .Hospital
        case "html5": self = .Html5
        case "inbox": self = .Inbox
        case "indent_left": self = .IndentLeft
        case "indent_right": self = .IndentRight
        case "info_sign": self = .InfoSign
        case "inr": self = .Inr
        case "instagram": self = .Instagram
        case "italic": self = .Italic
        case "jpy": self = .Jpy
        case "key": self = .Key
        case "keyboard": self = .Keyboard
        case "krw": self = .Krw
        case "laptop": self = .Laptop
        case "leaf": self = .Leaf
        case "legal": self = .Legal
        case "lemon": self = .Lemon
        case "lessequal": self = .Lessequal
        case "level_down": self = .LevelDown
        case "level_up": self = .LevelUp
        case "light_bulb": self = .LightBulb
        case "link": self = .Link
        case "linkedin": self = .Linkedin
        case "linkedin_sign": self = .LinkedinSign
        case "linux": self = .Linux
        case "list": self = .List
        case "list_alt": self = .ListAlt
        case "location_arrow": self = .LocationArrow
        case "lock": self = .Lock
        case "long_arrow_down": self = .LongArrowDown
        case "long_arrow_left": self = .LongArrowLeft
        case "long_arrow_right": self = .LongArrowRight
        case "long_arrow_up": self = .LongArrowUp
        case "magic": self = .Magic
        case "magnet": self = .Magnet
        case "male": self = .Male
        case "map_marker": self = .MapMarker
        case "maxcdn": self = .Maxcdn
        case "medkit": self = .Medkit
        case "meh": self = .Meh
        case "microphone": self = .Microphone
        case "microphone_off": self = .MicrophoneOff
        case "minus": self = .Minus
        case "minus_sign": self = .MinusSign
        case "minus_sign_alt": self = .MinusSignAlt
        case "mobile_phone": self = .MobilePhone
        case "money": self = .Money
        case "move": self = .Move
        case "music": self = .Music
        case "off": self = .Off
        case "ok": self = .Ok
        case "ok_circle": self = .OkCircle
        case "ok_sign": self = .OkSign
        case "ol": self = .Ol
        case "paper_clip": self = .PaperClip
        case "paste": self = .Paste
        case "pause": self = .Pause
        case "pencil": self = .Pencil
        case "phone": self = .Phone
        case "phone_sign": self = .PhoneSign
        case "picture": self = .Picture
        case "pinterest": self = .Pinterest
        case "pinterest_sign": self = .PinterestSign
        case "plane": self = .Plane
        case "play": self = .Play
        case "play_circle": self = .PlayCircle
        case "play_sign": self = .PlaySign
        case "plus": self = .Plus
        case "plus_sign": self = .PlusSign
        case "plus_square_o": self = .PlusSquareO
        case "print": self = .Print
        case "pushpin": self = .Pushpin
        case "puzzle_piece": self = .PuzzlePiece
        case "qrcode": self = .Qrcode
        case "question": self = .Question
        case "question_sign": self = .QuestionSign
        case "quote_left": self = .QuoteLeft
        case "quote_right": self = .QuoteRight
        case "random": self = .Random
        case "refresh": self = .Refresh
        case "remove": self = .Remove
        case "remove_circle": self = .RemoveCircle
        case "remove_sign": self = .RemoveSign
        case "renren": self = .Renren
        case "reorder": self = .Reorder
        case "repeat": self = .Repeat
        case "reply": self = .Reply
        case "reply_all": self = .ReplyAll
        case "resize_full": self = .ResizeFull
        case "resize_horizontal": self = .ResizeHorizontal
        case "resize_small": self = .ResizeSmall
        case "resize_vertical": self = .ResizeVertical
        case "retweet": self = .Retweet
        case "road": self = .Road
        case "rocket": self = .Rocket
        case "rss": self = .Rss
        case "rub": self = .Rub
        case "save": self = .Save
        case "screenshot": self = .Screenshot
        case "search": self = .Search
        case "share": self = .Share
        case "share_alt": self = .ShareAlt
        case "share_sign": self = .ShareSign
        case "shield": self = .Shield
        case "shopping_cart": self = .ShoppingCart
        case "sign_blank": self = .SignBlank
        case "signal": self = .Signal
        case "signin": self = .Signin
        case "signout": self = .Signout
        case "sitemap": self = .Sitemap
        case "skype": self = .Skype
        case "smile": self = .Smile
        case "sort": self = .Sort
        case "sort_by_alphabet": self = .SortByAlphabet
        case "sort_by_attributes": self = .SortByAttributes
        case "sort_by_attributes_alt": self = .SortByAttributesAlt
        case "sort_by_order": self = .SortByOrder
        case "sort_by_order_alt": self = .SortByOrderAlt
        case "sort_down": self = .SortDown
        case "sort_up": self = .SortUp
        case "spinner": self = .Spinner
        case "stack_exchange": self = .StackExchange
        case "stackexchange": self = .Stackexchange
        case "star": self = .Star
        case "star_empty": self = .StarEmpty
        case "star_half": self = .StarHalf
        case "star_half_empty": self = .StarHalfEmpty
        case "step_backward": self = .StepBackward
        case "step_forward": self = .StepForward
        case "stethoscope": self = .Stethoscope
        case "stop": self = .Stop
        case "strikethrough": self = .Strikethrough
        case "subscript": self = .Subscript
        case "suitcase": self = .Suitcase
        case "sun": self = .Sun
        case "superscript": self = .Superscript
        case "table": self = .Table
        case "tablet": self = .Tablet
        case "tag": self = .Tag
        case "tags": self = .Tags
        case "tasks": self = .Tasks
        case "terminal": self = .Terminal
        case "text_height": self = .TextHeight
        case "text_width": self = .TextWidth
        case "th": self = .Th
        case "th_large": self = .ThLarge
        case "th_list": self = .ThList
        case "thumbs_down_alt": self = .ThumbsDownAlt
        case "thumbs_up_alt": self = .ThumbsUpAlt
        case "ticket": self = .Ticket
        case "time": self = .Time
        case "tint": self = .Tint
        case "trash": self = .Trash
        case "trello": self = .Trello
        case "trophy": self = .Trophy
        case "truck": self = .Truck
        case "tumblr": self = .Tumblr
        case "tumblr_sign": self = .TumblrSign
        case "twitter": self = .Twitter
        case "twitter_sign": self = .TwitterSign
        case "ul": self = .Ul
        case "umbrella": self = .Umbrella
        case "underline": self = .Underline
        case "undo": self = .Undo
        case "unif1a0": self = .UniF1A0
        case "unif1b1": self = .UniF1B1
        case "unif1c0": self = .UniF1C0
        case "unif1c1": self = .UniF1C1
        case "unif1d0": self = .UniF1D0
        case "unif1d1": self = .UniF1D1
        case "unif1d2": self = .UniF1D2
        case "unif1d5": self = .UniF1D5
        case "unif1d6": self = .UniF1D6
        case "unif1d7": self = .UniF1D7
        case "unif1e0": self = .UniF1E0
        case "unif1f0": self = .UniF1F0
        case "unif280": self = .UniF280
        case "unif281": self = .UniF281
        case "unif285": self = .UniF285
        case "unif286": self = .UniF286
        case "unif2a0": self = .UniF2A0
        case "unif2a1": self = .UniF2A1
        case "unif2a2": self = .UniF2A2
        case "unif2a3": self = .UniF2A3
        case "unif2a4": self = .UniF2A4
        case "unif2a5": self = .UniF2A5
        case "unif2a6": self = .UniF2A6
        case "unif2a7": self = .UniF2A7
        case "unif2a8": self = .UniF2A8
        case "unif2a9": self = .UniF2A9
        case "unif2aa": self = .UniF2AA
        case "unif2ab": self = .UniF2AB
        case "unif2ac": self = .UniF2AC
        case "unif2ad": self = .UniF2AD
        case "unif2ae": self = .UniF2AE
        case "unif2b0": self = .UniF2B0
        case "unif2b1": self = .UniF2B1
        case "unif2b2": self = .UniF2B2
        case "unif2b3": self = .UniF2B3
        case "unif2b4": self = .UniF2B4
        case "unif2b5": self = .UniF2B5
        case "unif2b6": self = .UniF2B6
        case "unif2b7": self = .UniF2B7
        case "unif2b8": self = .UniF2B8
        case "unif2b9": self = .UniF2B9
        case "unif2ba": self = .UniF2BA
        case "unif2bb": self = .UniF2BB
        case "unif2bc": self = .UniF2BC
        case "unif2bd": self = .UniF2BD
        case "unif2be": self = .UniF2BE
        case "unlink": self = .Unlink
        case "unlock": self = .Unlock
        case "unlock_alt": self = .UnlockAlt
        case "upload": self = .Upload
        case "upload_alt": self = .UploadAlt
        case "usd": self = .Usd
        case "user": self = .User
        case "user_md": self = .UserMd
        case "venus": self = .Venus
        case "vimeo_square": self = .VimeoSquare
        case "vk": self = .Vk
        case "volume_down": self = .VolumeDown
        case "volume_off": self = .VolumeOff
        case "volume_up": self = .VolumeUp
        case "warning_sign": self = .WarningSign
        case "weibo": self = .Weibo
        case "windows": self = .Windows
        case "wrench": self = .Wrench
        case "xing": self = .Xing
        case "xing_sign": self = .XingSign
        case "youtube": self = .Youtube
        case "youtube_play": self = .YoutubePlay
        case "youtube_sign": self = .YoutubeSign
        case "zoom_in": self = .ZoomIn
        case "zoom_out": self = .ZoomOut
        default: self = FontAwesomeIcon(rawValue: 0)!
        }
    }
    /** The icon's name. */
    public var name: String {
        switch self {
        case ._279: return "_279"
        case ._283: return "_283"
        case ._303: return "_303"
        case ._312: return "_312"
        case ._317: return "_317"
        case ._329: return "_329"
        case ._334: return "_334"
        case ._335: return "_335"
        case ._366: return "_366"
        case ._372: return "_372"
        case ._374: return "_374"
        case ._376: return "_376"
        case ._378: return "_378"
        case ._380: return "_380"
        case ._382: return "_382"
        case ._383: return "_383"
        case ._384: return "_384"
        case ._385: return "_385"
        case ._386: return "_386"
        case ._387: return "_387"
        case ._388: return "_388"
        case ._389: return "_389"
        case ._392: return "_392"
        case ._393: return "_393"
        case ._395: return "_395"
        case ._396: return "_396"
        case ._397: return "_397"
        case ._398: return "_398"
        case ._399: return "_399"
        case ._400: return "_400"
        case ._402: return "_402"
        case ._403: return "_403"
        case ._404: return "_404"
        case ._406: return "_406"
        case ._407: return "_407"
        case ._408: return "_408"
        case ._409: return "_409"
        case ._410: return "_410"
        case ._411: return "_411"
        case ._412: return "_412"
        case ._413: return "_413"
        case ._414: return "_414"
        case ._415: return "_415"
        case ._416: return "_416"
        case ._417: return "_417"
        case ._418: return "_418"
        case ._419: return "_419"
        case ._422: return "_422"
        case ._423: return "_423"
        case ._424: return "_424"
        case ._425: return "_425"
        case ._426: return "_426"
        case ._427: return "_427"
        case ._428: return "_428"
        case ._429: return "_429"
        case ._430: return "_430"
        case ._431: return "_431"
        case ._432: return "_432"
        case ._433: return "_433"
        case ._434: return "_434"
        case ._438: return "_438"
        case ._439: return "_439"
        case ._443: return "_443"
        case ._444: return "_444"
        case ._445: return "_445"
        case ._446: return "_446"
        case ._447: return "_447"
        case ._448: return "_448"
        case ._449: return "_449"
        case ._451: return "_451"
        case ._452: return "_452"
        case ._453: return "_453"
        case ._454: return "_454"
        case ._455: return "_455"
        case ._456: return "_456"
        case ._457: return "_457"
        case ._458: return "_458"
        case ._459: return "_459"
        case ._460: return "_460"
        case ._461: return "_461"
        case ._462: return "_462"
        case ._463: return "_463"
        case ._464: return "_464"
        case ._466: return "_466"
        case ._467: return "_467"
        case ._469: return "_469"
        case ._470: return "_470"
        case ._471: return "_471"
        case ._472: return "_472"
        case ._473: return "_473"
        case ._474: return "_474"
        case ._475: return "_475"
        case ._476: return "_476"
        case ._478: return "_478"
        case ._479: return "_479"
        case ._480: return "_480"
        case ._481: return "_481"
        case ._482: return "_482"
        case ._483: return "_483"
        case ._484: return "_484"
        case ._485: return "_485"
        case ._486: return "_486"
        case ._487: return "_487"
        case ._488: return "_488"
        case ._489: return "_489"
        case ._490: return "_490"
        case ._491: return "_491"
        case ._492: return "_492"
        case ._493: return "_493"
        case ._494: return "_494"
        case ._496: return "_496"
        case ._498: return "_498"
        case ._499: return "_499"
        case ._500: return "_500"
        case ._501: return "_501"
        case ._502: return "_502"
        case ._503: return "_503"
        case ._504: return "_504"
        case ._505: return "_505"
        case ._506: return "_506"
        case ._507: return "_507"
        case ._508: return "_508"
        case ._509: return "_509"
        case ._511: return "_511"
        case ._512: return "_512"
        case ._513: return "_513"
        case ._514: return "_514"
        case ._515: return "_515"
        case ._516: return "_516"
        case ._517: return "_517"
        case ._518: return "_518"
        case ._519: return "_519"
        case ._520: return "_520"
        case ._521: return "_521"
        case ._522: return "_522"
        case ._523: return "_523"
        case ._524: return "_524"
        case ._525: return "_525"
        case ._526: return "_526"
        case ._527: return "_527"
        case ._528: return "_528"
        case ._529: return "_529"
        case ._530: return "_530"
        case ._531: return "_531"
        case ._532: return "_532"
        case ._533: return "_533"
        case ._534: return "_534"
        case ._535: return "_535"
        case ._536: return "_536"
        case ._537: return "_537"
        case ._538: return "_538"
        case ._539: return "_539"
        case ._540: return "_540"
        case ._541: return "_541"
        case ._542: return "_542"
        case ._543: return "_543"
        case ._544: return "_544"
        case ._545: return "_545"
        case ._546: return "_546"
        case ._547: return "_547"
        case ._548: return "_548"
        case ._549: return "_549"
        case ._550: return "_550"
        case ._551: return "_551"
        case ._552: return "_552"
        case ._553: return "_553"
        case ._554: return "_554"
        case ._555: return "_555"
        case ._556: return "_556"
        case ._557: return "_557"
        case ._558: return "_558"
        case ._559: return "_559"
        case ._560: return "_560"
        case ._561: return "_561"
        case ._562: return "_562"
        case ._563: return "_563"
        case ._564: return "_564"
        case ._565: return "_565"
        case ._566: return "_566"
        case ._567: return "_567"
        case ._568: return "_568"
        case ._569: return "_569"
        case ._572: return "_572"
        case ._574: return "_574"
        case ._575: return "_575"
        case ._576: return "_576"
        case ._577: return "_577"
        case ._578: return "_578"
        case ._579: return "_579"
        case ._580: return "_580"
        case ._581: return "_581"
        case ._582: return "_582"
        case ._583: return "_583"
        case ._584: return "_584"
        case ._585: return "_585"
        case ._586: return "_586"
        case ._587: return "_587"
        case ._588: return "_588"
        case ._589: return "_589"
        case ._590: return "_590"
        case ._591: return "_591"
        case ._592: return "_592"
        case ._593: return "_593"
        case ._594: return "_594"
        case ._595: return "_595"
        case ._596: return "_596"
        case ._597: return "_597"
        case ._598: return "_598"
        case ._602: return "_602"
        case ._603: return "_603"
        case ._604: return "_604"
        case ._607: return "_607"
        case ._608: return "_608"
        case ._609: return "_609"
        case ._610: return "_610"
        case ._611: return "_611"
        case ._612: return "_612"
        case ._613: return "_613"
        case ._614: return "_614"
        case ._615: return "_615"
        case ._616: return "_616"
        case ._617: return "_617"
        case ._618: return "_618"
        case ._619: return "_619"
        case ._620: return "_620"
        case ._621: return "_621"
        case ._622: return "_622"
        case ._623: return "_623"
        case ._624: return "_624"
        case ._625: return "_625"
        case ._626: return "_626"
        case ._627: return "_627"
        case ._628: return "_628"
        case ._629: return "_629"
        case .Adjust: return "Adjust"
        case .Adn: return "Adn"
        case .AlignCenter: return "AlignCenter"
        case .AlignJustify: return "AlignJustify"
        case .AlignLeft: return "AlignLeft"
        case .AlignRight: return "AlignRight"
        case .Ambulance: return "Ambulance"
        case .Anchor: return "Anchor"
        case .Android: return "Android"
        case .AngleDown: return "AngleDown"
        case .AngleLeft: return "AngleLeft"
        case .AngleRight: return "AngleRight"
        case .AngleUp: return "AngleUp"
        case .Apple: return "Apple"
        case .Archive: return "Archive"
        case .ArrowCircleAltLeft: return "ArrowCircleAltLeft"
        case .ArrowDown: return "ArrowDown"
        case .ArrowLeft: return "ArrowLeft"
        case .ArrowRight: return "ArrowRight"
        case .ArrowUp: return "ArrowUp"
        case .Asterisk: return "Asterisk"
        case .Backward: return "Backward"
        case .BanCircle: return "BanCircle"
        case .BarChart: return "BarChart"
        case .Barcode: return "Barcode"
        case .Beaker: return "Beaker"
        case .Beer: return "Beer"
        case .Bell: return "Bell"
        case .BellAlt: return "BellAlt"
        case .BitbucketSign: return "BitbucketSign"
        case .Bold: return "Bold"
        case .Bolt: return "Bolt"
        case .Book: return "Book"
        case .Bookmark: return "Bookmark"
        case .BookmarkEmpty: return "BookmarkEmpty"
        case .Briefcase: return "Briefcase"
        case .Btc: return "Btc"
        case .Bug: return "Bug"
        case .Building: return "Building"
        case .Bullhorn: return "Bullhorn"
        case .Bullseye: return "Bullseye"
        case .Calendar: return "Calendar"
        case .CalendarEmpty: return "CalendarEmpty"
        case .Camera: return "Camera"
        case .CameraRetro: return "CameraRetro"
        case .CaretDown: return "CaretDown"
        case .CaretLeft: return "CaretLeft"
        case .CaretRight: return "CaretRight"
        case .CaretUp: return "CaretUp"
        case .Certificate: return "Certificate"
        case .Check: return "Check"
        case .CheckEmpty: return "CheckEmpty"
        case .CheckMinus: return "CheckMinus"
        case .CheckSign: return "CheckSign"
        case .ChevronDown: return "ChevronDown"
        case .ChevronLeft: return "ChevronLeft"
        case .ChevronRight: return "ChevronRight"
        case .ChevronSignDown: return "ChevronSignDown"
        case .ChevronSignLeft: return "ChevronSignLeft"
        case .ChevronSignRight: return "ChevronSignRight"
        case .ChevronSignUp: return "ChevronSignUp"
        case .ChevronUp: return "ChevronUp"
        case .Circle: return "Circle"
        case .CircleArrowDown: return "CircleArrowDown"
        case .CircleArrowLeft: return "CircleArrowLeft"
        case .CircleArrowRight: return "CircleArrowRight"
        case .CircleArrowUp: return "CircleArrowUp"
        case .CircleBlank: return "CircleBlank"
        case .Cloud: return "Cloud"
        case .CloudDownload: return "CloudDownload"
        case .CloudUpload: return "CloudUpload"
        case .Code: return "Code"
        case .CodeFork: return "CodeFork"
        case .Coffee: return "Coffee"
        case .Cog: return "Cog"
        case .Cogs: return "Cogs"
        case .Collapse: return "Collapse"
        case .CollapseAlt: return "CollapseAlt"
        case .CollapseTop: return "CollapseTop"
        case .Columns: return "Columns"
        case .Comment: return "Comment"
        case .CommentAlt: return "CommentAlt"
        case .Comments: return "Comments"
        case .CommentsAlt: return "CommentsAlt"
        case .Compass: return "Compass"
        case .Copy: return "Copy"
        case .CreditCard: return "CreditCard"
        case .Crop: return "Crop"
        case .Css3: return "Css3"
        case .Cut: return "Cut"
        case .Dashboard: return "Dashboard"
        case .Desktop: return "Desktop"
        case .DotCircleAlt: return "DotCircleAlt"
        case .DoubleAngleDown: return "DoubleAngleDown"
        case .DoubleAngleLeft: return "DoubleAngleLeft"
        case .DoubleAngleRight: return "DoubleAngleRight"
        case .DoubleAngleUp: return "DoubleAngleUp"
        case .Download: return "Download"
        case .DownloadAlt: return "DownloadAlt"
        case .Dribble: return "Dribble"
        case .Dropbox: return "Dropbox"
        case .Edit: return "Edit"
        case .EditSign: return "EditSign"
        case .Eject: return "Eject"
        case .EllipsisHorizontal: return "EllipsisHorizontal"
        case .EllipsisVertical: return "EllipsisVertical"
        case .Envelope: return "Envelope"
        case .EnvelopeAlt: return "EnvelopeAlt"
        case .Eur: return "Eur"
        case .Exchange: return "Exchange"
        case .Exclamation: return "Exclamation"
        case .ExclamationSign: return "ExclamationSign"
        case .ExpandAlt: return "ExpandAlt"
        case .ExternalLink: return "ExternalLink"
        case .EyeClose: return "EyeClose"
        case .EyeOpen: return "EyeOpen"
        case .F0fe: return "F0fe"
        case .F171: return "F171"
        case .F1a1: return "F1a1"
        case .F1a4: return "F1a4"
        case .F1ab: return "F1ab"
        case .F1f3: return "F1f3"
        case .F1fc: return "F1fc"
        case .F210: return "F210"
        case .F212: return "F212"
        case .F260: return "F260"
        case .F261: return "F261"
        case .F263: return "F263"
        case .F27e: return "F27e"
        case .Facebook: return "Facebook"
        case .FacebookSign: return "FacebookSign"
        case .FacetimeVideo: return "FacetimeVideo"
        case .FastBackward: return "FastBackward"
        case .FastForward: return "FastForward"
        case .Female: return "Female"
        case .FighterJet: return "FighterJet"
        case .File: return "File"
        case .FileAlt: return "FileAlt"
        case .FileText: return "FileText"
        case .FileTextAlt: return "FileTextAlt"
        case .Film: return "Film"
        case .Filter: return "Filter"
        case .Fire: return "Fire"
        case .FireExtinguisher: return "FireExtinguisher"
        case .Flag: return "Flag"
        case .FlagAlt: return "FlagAlt"
        case .FlagCheckered: return "FlagCheckered"
        case .Flickr: return "Flickr"
        case .FolderClose: return "FolderClose"
        case .FolderCloseAlt: return "FolderCloseAlt"
        case .FolderOpen: return "FolderOpen"
        case .FolderOpenAlt: return "FolderOpenAlt"
        case .Font: return "Font"
        case .Food: return "Food"
        case .Forward: return "Forward"
        case .Foursquare: return "Foursquare"
        case .Frown: return "Frown"
        case .Fullscreen: return "Fullscreen"
        case .Gamepad: return "Gamepad"
        case .Gbp: return "Gbp"
        case .Gift: return "Gift"
        case .Github: return "Github"
        case .GithubAlt: return "GithubAlt"
        case .GithubSign: return "GithubSign"
        case .Gittip: return "Gittip"
        case .Glass: return "Glass"
        case .Globe: return "Globe"
        case .GooglePlus: return "GooglePlus"
        case .GooglePlusSign: return "GooglePlusSign"
        case .Group: return "Group"
        case .HSign: return "HSign"
        case .HandDown: return "HandDown"
        case .HandLeft: return "HandLeft"
        case .HandRight: return "HandRight"
        case .HandUp: return "HandUp"
        case .Hdd: return "Hdd"
        case .Headphones: return "Headphones"
        case .Heart: return "Heart"
        case .HeartEmpty: return "HeartEmpty"
        case .Home: return "Home"
        case .Hospital: return "Hospital"
        case .Html5: return "Html5"
        case .Inbox: return "Inbox"
        case .IndentLeft: return "IndentLeft"
        case .IndentRight: return "IndentRight"
        case .InfoSign: return "InfoSign"
        case .Inr: return "Inr"
        case .Instagram: return "Instagram"
        case .Italic: return "Italic"
        case .Jpy: return "Jpy"
        case .Key: return "Key"
        case .Keyboard: return "Keyboard"
        case .Krw: return "Krw"
        case .Laptop: return "Laptop"
        case .Leaf: return "Leaf"
        case .Legal: return "Legal"
        case .Lemon: return "Lemon"
        case .Lessequal: return "Lessequal"
        case .LevelDown: return "LevelDown"
        case .LevelUp: return "LevelUp"
        case .LightBulb: return "LightBulb"
        case .Link: return "Link"
        case .Linkedin: return "Linkedin"
        case .LinkedinSign: return "LinkedinSign"
        case .Linux: return "Linux"
        case .List: return "List"
        case .ListAlt: return "ListAlt"
        case .LocationArrow: return "LocationArrow"
        case .Lock: return "Lock"
        case .LongArrowDown: return "LongArrowDown"
        case .LongArrowLeft: return "LongArrowLeft"
        case .LongArrowRight: return "LongArrowRight"
        case .LongArrowUp: return "LongArrowUp"
        case .Magic: return "Magic"
        case .Magnet: return "Magnet"
        case .Male: return "Male"
        case .MapMarker: return "MapMarker"
        case .Maxcdn: return "Maxcdn"
        case .Medkit: return "Medkit"
        case .Meh: return "Meh"
        case .Microphone: return "Microphone"
        case .MicrophoneOff: return "MicrophoneOff"
        case .Minus: return "Minus"
        case .MinusSign: return "MinusSign"
        case .MinusSignAlt: return "MinusSignAlt"
        case .MobilePhone: return "MobilePhone"
        case .Money: return "Money"
        case .Move: return "Move"
        case .Music: return "Music"
        case .Off: return "Off"
        case .Ok: return "Ok"
        case .OkCircle: return "OkCircle"
        case .OkSign: return "OkSign"
        case .Ol: return "Ol"
        case .PaperClip: return "PaperClip"
        case .Paste: return "Paste"
        case .Pause: return "Pause"
        case .Pencil: return "Pencil"
        case .Phone: return "Phone"
        case .PhoneSign: return "PhoneSign"
        case .Picture: return "Picture"
        case .Pinterest: return "Pinterest"
        case .PinterestSign: return "PinterestSign"
        case .Plane: return "Plane"
        case .Play: return "Play"
        case .PlayCircle: return "PlayCircle"
        case .PlaySign: return "PlaySign"
        case .Plus: return "Plus"
        case .PlusSign: return "PlusSign"
        case .PlusSquareO: return "PlusSquareO"
        case .Print: return "Print"
        case .Pushpin: return "Pushpin"
        case .PuzzlePiece: return "PuzzlePiece"
        case .Qrcode: return "Qrcode"
        case .Question: return "Question"
        case .QuestionSign: return "QuestionSign"
        case .QuoteLeft: return "QuoteLeft"
        case .QuoteRight: return "QuoteRight"
        case .Random: return "Random"
        case .Refresh: return "Refresh"
        case .Remove: return "Remove"
        case .RemoveCircle: return "RemoveCircle"
        case .RemoveSign: return "RemoveSign"
        case .Renren: return "Renren"
        case .Reorder: return "Reorder"
        case .Repeat: return "Repeat"
        case .Reply: return "Reply"
        case .ReplyAll: return "ReplyAll"
        case .ResizeFull: return "ResizeFull"
        case .ResizeHorizontal: return "ResizeHorizontal"
        case .ResizeSmall: return "ResizeSmall"
        case .ResizeVertical: return "ResizeVertical"
        case .Retweet: return "Retweet"
        case .Road: return "Road"
        case .Rocket: return "Rocket"
        case .Rss: return "Rss"
        case .Rub: return "Rub"
        case .Save: return "Save"
        case .Screenshot: return "Screenshot"
        case .Search: return "Search"
        case .Share: return "Share"
        case .ShareAlt: return "ShareAlt"
        case .ShareSign: return "ShareSign"
        case .Shield: return "Shield"
        case .ShoppingCart: return "ShoppingCart"
        case .SignBlank: return "SignBlank"
        case .Signal: return "Signal"
        case .Signin: return "Signin"
        case .Signout: return "Signout"
        case .Sitemap: return "Sitemap"
        case .Skype: return "Skype"
        case .Smile: return "Smile"
        case .Sort: return "Sort"
        case .SortByAlphabet: return "SortByAlphabet"
        case .SortByAttributes: return "SortByAttributes"
        case .SortByAttributesAlt: return "SortByAttributesAlt"
        case .SortByOrder: return "SortByOrder"
        case .SortByOrderAlt: return "SortByOrderAlt"
        case .SortDown: return "SortDown"
        case .SortUp: return "SortUp"
        case .Spinner: return "Spinner"
        case .StackExchange: return "StackExchange"
        case .Stackexchange: return "Stackexchange"
        case .Star: return "Star"
        case .StarEmpty: return "StarEmpty"
        case .StarHalf: return "StarHalf"
        case .StarHalfEmpty: return "StarHalfEmpty"
        case .StepBackward: return "StepBackward"
        case .StepForward: return "StepForward"
        case .Stethoscope: return "Stethoscope"
        case .Stop: return "Stop"
        case .Strikethrough: return "Strikethrough"
        case .Subscript: return "Subscript"
        case .Suitcase: return "Suitcase"
        case .Sun: return "Sun"
        case .Superscript: return "Superscript"
        case .Table: return "Table"
        case .Tablet: return "Tablet"
        case .Tag: return "Tag"
        case .Tags: return "Tags"
        case .Tasks: return "Tasks"
        case .Terminal: return "Terminal"
        case .TextHeight: return "TextHeight"
        case .TextWidth: return "TextWidth"
        case .Th: return "Th"
        case .ThLarge: return "ThLarge"
        case .ThList: return "ThList"
        case .ThumbsDownAlt: return "ThumbsDownAlt"
        case .ThumbsUpAlt: return "ThumbsUpAlt"
        case .Ticket: return "Ticket"
        case .Time: return "Time"
        case .Tint: return "Tint"
        case .Trash: return "Trash"
        case .Trello: return "Trello"
        case .Trophy: return "Trophy"
        case .Truck: return "Truck"
        case .Tumblr: return "Tumblr"
        case .TumblrSign: return "TumblrSign"
        case .Twitter: return "Twitter"
        case .TwitterSign: return "TwitterSign"
        case .Ul: return "Ul"
        case .Umbrella: return "Umbrella"
        case .Underline: return "Underline"
        case .Undo: return "Undo"
        case .UniF1A0: return "UniF1A0"
        case .UniF1B1: return "UniF1B1"
        case .UniF1C0: return "UniF1C0"
        case .UniF1C1: return "UniF1C1"
        case .UniF1D0: return "UniF1D0"
        case .UniF1D1: return "UniF1D1"
        case .UniF1D2: return "UniF1D2"
        case .UniF1D5: return "UniF1D5"
        case .UniF1D6: return "UniF1D6"
        case .UniF1D7: return "UniF1D7"
        case .UniF1E0: return "UniF1E0"
        case .UniF1F0: return "UniF1F0"
        case .UniF280: return "UniF280"
        case .UniF281: return "UniF281"
        case .UniF285: return "UniF285"
        case .UniF286: return "UniF286"
        case .UniF2A0: return "UniF2A0"
        case .UniF2A1: return "UniF2A1"
        case .UniF2A2: return "UniF2A2"
        case .UniF2A3: return "UniF2A3"
        case .UniF2A4: return "UniF2A4"
        case .UniF2A5: return "UniF2A5"
        case .UniF2A6: return "UniF2A6"
        case .UniF2A7: return "UniF2A7"
        case .UniF2A8: return "UniF2A8"
        case .UniF2A9: return "UniF2A9"
        case .UniF2AA: return "UniF2AA"
        case .UniF2AB: return "UniF2AB"
        case .UniF2AC: return "UniF2AC"
        case .UniF2AD: return "UniF2AD"
        case .UniF2AE: return "UniF2AE"
        case .UniF2B0: return "UniF2B0"
        case .UniF2B1: return "UniF2B1"
        case .UniF2B2: return "UniF2B2"
        case .UniF2B3: return "UniF2B3"
        case .UniF2B4: return "UniF2B4"
        case .UniF2B5: return "UniF2B5"
        case .UniF2B6: return "UniF2B6"
        case .UniF2B7: return "UniF2B7"
        case .UniF2B8: return "UniF2B8"
        case .UniF2B9: return "UniF2B9"
        case .UniF2BA: return "UniF2BA"
        case .UniF2BB: return "UniF2BB"
        case .UniF2BC: return "UniF2BC"
        case .UniF2BD: return "UniF2BD"
        case .UniF2BE: return "UniF2BE"
        case .Unlink: return "Unlink"
        case .Unlock: return "Unlock"
        case .UnlockAlt: return "UnlockAlt"
        case .Upload: return "Upload"
        case .UploadAlt: return "UploadAlt"
        case .Usd: return "Usd"
        case .User: return "User"
        case .UserMd: return "UserMd"
        case .Venus: return "Venus"
        case .VimeoSquare: return "VimeoSquare"
        case .Vk: return "Vk"
        case .VolumeDown: return "VolumeDown"
        case .VolumeOff: return "VolumeOff"
        case .VolumeUp: return "VolumeUp"
        case .WarningSign: return "WarningSign"
        case .Weibo: return "Weibo"
        case .Windows: return "Windows"
        case .Wrench: return "Wrench"
        case .Xing: return "Xing"
        case .XingSign: return "XingSign"
        case .Youtube: return "Youtube"
        case .YoutubePlay: return "YoutubePlay"
        case .YoutubeSign: return "YoutubeSign"
        case .ZoomIn: return "ZoomIn"
        case .ZoomOut: return "ZoomOut"
        }
    }
    /** The icon's unicode. */
    public var unicode: String {
        switch self {
        case ._279: return "\u{F129}"
        case ._283: return "\u{F12D}"
        case ._303: return "\u{F143}"
        case ._312: return "\u{F14C}"
        case ._317: return "\u{F152}"
        case ._329: return "\u{F15E}"
        case ._334: return "\u{F164}"
        case ._335: return "\u{F165}"
        case ._366: return "\u{F186}"
        case ._372: return "\u{F18C}"
        case ._374: return "\u{F18E}"
        case ._376: return "\u{F191}"
        case ._378: return "\u{F193}"
        case ._380: return "\u{F195}"
        case ._382: return "\u{F197}"
        case ._383: return "\u{F198}"
        case ._384: return "\u{F199}"
        case ._385: return "\u{F19A}"
        case ._386: return "\u{F19B}"
        case ._387: return "\u{F19C}"
        case ._388: return "\u{F19D}"
        case ._389: return "\u{F19E}"
        case ._392: return "\u{F1A2}"
        case ._393: return "\u{F1A3}"
        case ._395: return "\u{F1A5}"
        case ._396: return "\u{F1A6}"
        case ._397: return "\u{F1A7}"
        case ._398: return "\u{F1A8}"
        case ._399: return "\u{F1A9}"
        case ._400: return "\u{F1AA}"
        case ._402: return "\u{F1AC}"
        case ._403: return "\u{F1AD}"
        case ._404: return "\u{F1AE}"
        case ._406: return "\u{F1B1}"
        case ._407: return "\u{F1B2}"
        case ._408: return "\u{F1B3}"
        case ._409: return "\u{F1B4}"
        case ._410: return "\u{F1B5}"
        case ._411: return "\u{F1B6}"
        case ._412: return "\u{F1B7}"
        case ._413: return "\u{F1B8}"
        case ._414: return "\u{F1B9}"
        case ._415: return "\u{F1BA}"
        case ._416: return "\u{F1BB}"
        case ._417: return "\u{F1BC}"
        case ._418: return "\u{F1BD}"
        case ._419: return "\u{F1BE}"
        case ._422: return "\u{F1C2}"
        case ._423: return "\u{F1C3}"
        case ._424: return "\u{F1C4}"
        case ._425: return "\u{F1C5}"
        case ._426: return "\u{F1C6}"
        case ._427: return "\u{F1C7}"
        case ._428: return "\u{F1C8}"
        case ._429: return "\u{F1C9}"
        case ._430: return "\u{F1CA}"
        case ._431: return "\u{F1CB}"
        case ._432: return "\u{F1CC}"
        case ._433: return "\u{F1CD}"
        case ._434: return "\u{F1CE}"
        case ._438: return "\u{F1D3}"
        case ._439: return "\u{F1D4}"
        case ._443: return "\u{F1D8}"
        case ._444: return "\u{F1D9}"
        case ._445: return "\u{F1DA}"
        case ._446: return "\u{F1DB}"
        case ._447: return "\u{F1DC}"
        case ._448: return "\u{F1DD}"
        case ._449: return "\u{F1DE}"
        case ._451: return "\u{F1E1}"
        case ._452: return "\u{F1E2}"
        case ._453: return "\u{F1E3}"
        case ._454: return "\u{F1E4}"
        case ._455: return "\u{F1E5}"
        case ._456: return "\u{F1E6}"
        case ._457: return "\u{F1E7}"
        case ._458: return "\u{F1E8}"
        case ._459: return "\u{F1E9}"
        case ._460: return "\u{F1EA}"
        case ._461: return "\u{F1EB}"
        case ._462: return "\u{F1EC}"
        case ._463: return "\u{F1ED}"
        case ._464: return "\u{F1EE}"
        case ._466: return "\u{F1F1}"
        case ._467: return "\u{F1F2}"
        case ._469: return "\u{F1F4}"
        case ._470: return "\u{F1F5}"
        case ._471: return "\u{F1F6}"
        case ._472: return "\u{F1F7}"
        case ._473: return "\u{F1F8}"
        case ._474: return "\u{F1F9}"
        case ._475: return "\u{F1FA}"
        case ._476: return "\u{F1FB}"
        case ._478: return "\u{F1FD}"
        case ._479: return "\u{F1FE}"
        case ._480: return "\u{F200}"
        case ._481: return "\u{F201}"
        case ._482: return "\u{F202}"
        case ._483: return "\u{F203}"
        case ._484: return "\u{F204}"
        case ._485: return "\u{F205}"
        case ._486: return "\u{F206}"
        case ._487: return "\u{F207}"
        case ._488: return "\u{F208}"
        case ._489: return "\u{F209}"
        case ._490: return "\u{F20A}"
        case ._491: return "\u{F20B}"
        case ._492: return "\u{F20C}"
        case ._493: return "\u{F20D}"
        case ._494: return "\u{F20E}"
        case ._496: return "\u{F211}"
        case ._498: return "\u{F213}"
        case ._499: return "\u{F214}"
        case ._500: return "\u{F215}"
        case ._501: return "\u{F216}"
        case ._502: return "\u{F217}"
        case ._503: return "\u{F218}"
        case ._504: return "\u{F219}"
        case ._505: return "\u{F21A}"
        case ._506: return "\u{F21B}"
        case ._507: return "\u{F21C}"
        case ._508: return "\u{F21D}"
        case ._509: return "\u{F21E}"
        case ._511: return "\u{F222}"
        case ._512: return "\u{F223}"
        case ._513: return "\u{F224}"
        case ._514: return "\u{F225}"
        case ._515: return "\u{F226}"
        case ._516: return "\u{F227}"
        case ._517: return "\u{F228}"
        case ._518: return "\u{F229}"
        case ._519: return "\u{F22A}"
        case ._520: return "\u{F22B}"
        case ._521: return "\u{F22C}"
        case ._522: return "\u{F22D}"
        case ._523: return "\u{F22E}"
        case ._524: return "\u{F22F}"
        case ._525: return "\u{F230}"
        case ._526: return "\u{F231}"
        case ._527: return "\u{F232}"
        case ._528: return "\u{F233}"
        case ._529: return "\u{F234}"
        case ._530: return "\u{F235}"
        case ._531: return "\u{F236}"
        case ._532: return "\u{F237}"
        case ._533: return "\u{F238}"
        case ._534: return "\u{F239}"
        case ._535: return "\u{F23A}"
        case ._536: return "\u{F23B}"
        case ._537: return "\u{F23C}"
        case ._538: return "\u{F23D}"
        case ._539: return "\u{F23E}"
        case ._540: return "\u{F240}"
        case ._541: return "\u{F241}"
        case ._542: return "\u{F242}"
        case ._543: return "\u{F243}"
        case ._544: return "\u{F244}"
        case ._545: return "\u{F245}"
        case ._546: return "\u{F246}"
        case ._547: return "\u{F247}"
        case ._548: return "\u{F248}"
        case ._549: return "\u{F249}"
        case ._550: return "\u{F24A}"
        case ._551: return "\u{F24B}"
        case ._552: return "\u{F24C}"
        case ._553: return "\u{F24D}"
        case ._554: return "\u{F24E}"
        case ._555: return "\u{F250}"
        case ._556: return "\u{F251}"
        case ._557: return "\u{F252}"
        case ._558: return "\u{F253}"
        case ._559: return "\u{F254}"
        case ._560: return "\u{F255}"
        case ._561: return "\u{F256}"
        case ._562: return "\u{F257}"
        case ._563: return "\u{F258}"
        case ._564: return "\u{F259}"
        case ._565: return "\u{F25A}"
        case ._566: return "\u{F25B}"
        case ._567: return "\u{F25C}"
        case ._568: return "\u{F25D}"
        case ._569: return "\u{F25E}"
        case ._572: return "\u{F262}"
        case ._574: return "\u{F264}"
        case ._575: return "\u{F265}"
        case ._576: return "\u{F266}"
        case ._577: return "\u{F267}"
        case ._578: return "\u{F268}"
        case ._579: return "\u{F269}"
        case ._580: return "\u{F26A}"
        case ._581: return "\u{F26B}"
        case ._582: return "\u{F26C}"
        case ._583: return "\u{F26D}"
        case ._584: return "\u{F26E}"
        case ._585: return "\u{F270}"
        case ._586: return "\u{F271}"
        case ._587: return "\u{F272}"
        case ._588: return "\u{F273}"
        case ._589: return "\u{F274}"
        case ._590: return "\u{F275}"
        case ._591: return "\u{F276}"
        case ._592: return "\u{F277}"
        case ._593: return "\u{F278}"
        case ._594: return "\u{F279}"
        case ._595: return "\u{F27A}"
        case ._596: return "\u{F27B}"
        case ._597: return "\u{F27C}"
        case ._598: return "\u{F27D}"
        case ._602: return "\u{F282}"
        case ._603: return "\u{F283}"
        case ._604: return "\u{F284}"
        case ._607: return "\u{F287}"
        case ._608: return "\u{F288}"
        case ._609: return "\u{F289}"
        case ._610: return "\u{F28A}"
        case ._611: return "\u{F28B}"
        case ._612: return "\u{F28C}"
        case ._613: return "\u{F28D}"
        case ._614: return "\u{F28E}"
        case ._615: return "\u{F290}"
        case ._616: return "\u{F291}"
        case ._617: return "\u{F292}"
        case ._618: return "\u{F293}"
        case ._619: return "\u{F294}"
        case ._620: return "\u{F295}"
        case ._621: return "\u{F296}"
        case ._622: return "\u{F297}"
        case ._623: return "\u{F298}"
        case ._624: return "\u{F299}"
        case ._625: return "\u{F29A}"
        case ._626: return "\u{F29B}"
        case ._627: return "\u{F29C}"
        case ._628: return "\u{F29D}"
        case ._629: return "\u{F29E}"
        case .Adjust: return "\u{F042}"
        case .Adn: return "\u{F170}"
        case .AlignCenter: return "\u{F037}"
        case .AlignJustify: return "\u{F039}"
        case .AlignLeft: return "\u{F036}"
        case .AlignRight: return "\u{F038}"
        case .Ambulance: return "\u{F0F9}"
        case .Anchor: return "\u{F13D}"
        case .Android: return "\u{F17B}"
        case .AngleDown: return "\u{F107}"
        case .AngleLeft: return "\u{F104}"
        case .AngleRight: return "\u{F105}"
        case .AngleUp: return "\u{F106}"
        case .Apple: return "\u{F179}"
        case .Archive: return "\u{F187}"
        case .ArrowCircleAltLeft: return "\u{F190}"
        case .ArrowDown: return "\u{F063}"
        case .ArrowLeft: return "\u{F060}"
        case .ArrowRight: return "\u{F061}"
        case .ArrowUp: return "\u{F062}"
        case .Asterisk: return "\u{F069}"
        case .Backward: return "\u{F04A}"
        case .BanCircle: return "\u{F05E}"
        case .BarChart: return "\u{F080}"
        case .Barcode: return "\u{F02A}"
        case .Beaker: return "\u{F0C3}"
        case .Beer: return "\u{F0FC}"
        case .Bell: return "\u{F0A2}"
        case .BellAlt: return "\u{F0F3}"
        case .BitbucketSign: return "\u{F172}"
        case .Bold: return "\u{F032}"
        case .Bolt: return "\u{F0E7}"
        case .Book: return "\u{F02D}"
        case .Bookmark: return "\u{F02E}"
        case .BookmarkEmpty: return "\u{F097}"
        case .Briefcase: return "\u{F0B1}"
        case .Btc: return "\u{F15A}"
        case .Bug: return "\u{F188}"
        case .Building: return "\u{F0F7}"
        case .Bullhorn: return "\u{F0A1}"
        case .Bullseye: return "\u{F140}"
        case .Calendar: return "\u{F073}"
        case .CalendarEmpty: return "\u{F133}"
        case .Camera: return "\u{F030}"
        case .CameraRetro: return "\u{F083}"
        case .CaretDown: return "\u{F0D7}"
        case .CaretLeft: return "\u{F0D9}"
        case .CaretRight: return "\u{F0DA}"
        case .CaretUp: return "\u{F0D8}"
        case .Certificate: return "\u{F0A3}"
        case .Check: return "\u{F046}"
        case .CheckEmpty: return "\u{F096}"
        case .CheckMinus: return "\u{F147}"
        case .CheckSign: return "\u{F14A}"
        case .ChevronDown: return "\u{F078}"
        case .ChevronLeft: return "\u{F053}"
        case .ChevronRight: return "\u{F054}"
        case .ChevronSignDown: return "\u{F13A}"
        case .ChevronSignLeft: return "\u{F137}"
        case .ChevronSignRight: return "\u{F138}"
        case .ChevronSignUp: return "\u{F139}"
        case .ChevronUp: return "\u{F077}"
        case .Circle: return "\u{F111}"
        case .CircleArrowDown: return "\u{F0AB}"
        case .CircleArrowLeft: return "\u{F0A8}"
        case .CircleArrowRight: return "\u{F0A9}"
        case .CircleArrowUp: return "\u{F0AA}"
        case .CircleBlank: return "\u{F10C}"
        case .Cloud: return "\u{F0C2}"
        case .CloudDownload: return "\u{F0ED}"
        case .CloudUpload: return "\u{F0EE}"
        case .Code: return "\u{F121}"
        case .CodeFork: return "\u{F126}"
        case .Coffee: return "\u{F0F4}"
        case .Cog: return "\u{F013}"
        case .Cogs: return "\u{F085}"
        case .Collapse: return "\u{F150}"
        case .CollapseAlt: return "\u{F117}"
        case .CollapseTop: return "\u{F151}"
        case .Columns: return "\u{F0DB}"
        case .Comment: return "\u{F075}"
        case .CommentAlt: return "\u{F0E5}"
        case .Comments: return "\u{F086}"
        case .CommentsAlt: return "\u{F0E6}"
        case .Compass: return "\u{F14E}"
        case .Copy: return "\u{F0C5}"
        case .CreditCard: return "\u{F09D}"
        case .Crop: return "\u{F125}"
        case .Css3: return "\u{F13C}"
        case .Cut: return "\u{F0C4}"
        case .Dashboard: return "\u{F0E4}"
        case .Desktop: return "\u{F108}"
        case .DotCircleAlt: return "\u{F192}"
        case .DoubleAngleDown: return "\u{F103}"
        case .DoubleAngleLeft: return "\u{F100}"
        case .DoubleAngleRight: return "\u{F101}"
        case .DoubleAngleUp: return "\u{F102}"
        case .Download: return "\u{F01A}"
        case .DownloadAlt: return "\u{F019}"
        case .Dribble: return "\u{F17D}"
        case .Dropbox: return "\u{F16B}"
        case .Edit: return "\u{F044}"
        case .EditSign: return "\u{F14B}"
        case .Eject: return "\u{F052}"
        case .EllipsisHorizontal: return "\u{F141}"
        case .EllipsisVertical: return "\u{F142}"
        case .Envelope: return "\u{F003}"
        case .EnvelopeAlt: return "\u{F0E0}"
        case .Eur: return "\u{F153}"
        case .Exchange: return "\u{F0EC}"
        case .Exclamation: return "\u{F12A}"
        case .ExclamationSign: return "\u{F06A}"
        case .ExpandAlt: return "\u{F116}"
        case .ExternalLink: return "\u{F08E}"
        case .EyeClose: return "\u{F070}"
        case .EyeOpen: return "\u{F06E}"
        case .F0fe: return "\u{F0FE}"
        case .F171: return "\u{F171}"
        case .F1a1: return "\u{F1A1}"
        case .F1a4: return "\u{F1A4}"
        case .F1ab: return "\u{F1AB}"
        case .F1f3: return "\u{F1F3}"
        case .F1fc: return "\u{F1FC}"
        case .F210: return "\u{F210}"
        case .F212: return "\u{F212}"
        case .F260: return "\u{F260}"
        case .F261: return "\u{F261}"
        case .F263: return "\u{F263}"
        case .F27e: return "\u{F27E}"
        case .Facebook: return "\u{F09A}"
        case .FacebookSign: return "\u{F082}"
        case .FacetimeVideo: return "\u{F03D}"
        case .FastBackward: return "\u{F049}"
        case .FastForward: return "\u{F050}"
        case .Female: return "\u{F182}"
        case .FighterJet: return "\u{F0FB}"
        case .File: return "\u{F15B}"
        case .FileAlt: return "\u{F016}"
        case .FileText: return "\u{F15C}"
        case .FileTextAlt: return "\u{F0F6}"
        case .Film: return "\u{F008}"
        case .Filter: return "\u{F0B0}"
        case .Fire: return "\u{F06D}"
        case .FireExtinguisher: return "\u{F134}"
        case .Flag: return "\u{F024}"
        case .FlagAlt: return "\u{F11D}"
        case .FlagCheckered: return "\u{F11E}"
        case .Flickr: return "\u{F16E}"
        case .FolderClose: return "\u{F07B}"
        case .FolderCloseAlt: return "\u{F114}"
        case .FolderOpen: return "\u{F07C}"
        case .FolderOpenAlt: return "\u{F115}"
        case .Font: return "\u{F031}"
        case .Food: return "\u{F0F5}"
        case .Forward: return "\u{F04E}"
        case .Foursquare: return "\u{F180}"
        case .Frown: return "\u{F119}"
        case .Fullscreen: return "\u{F0B2}"
        case .Gamepad: return "\u{F11B}"
        case .Gbp: return "\u{F154}"
        case .Gift: return "\u{F06B}"
        case .Github: return "\u{F09B}"
        case .GithubAlt: return "\u{F113}"
        case .GithubSign: return "\u{F092}"
        case .Gittip: return "\u{F184}"
        case .Glass: return "\u{F000}"
        case .Globe: return "\u{F0AC}"
        case .GooglePlus: return "\u{F0D5}"
        case .GooglePlusSign: return "\u{F0D4}"
        case .Group: return "\u{F0C0}"
        case .HSign: return "\u{F0FD}"
        case .HandDown: return "\u{F0A7}"
        case .HandLeft: return "\u{F0A5}"
        case .HandRight: return "\u{F0A4}"
        case .HandUp: return "\u{F0A6}"
        case .Hdd: return "\u{F0A0}"
        case .Headphones: return "\u{F025}"
        case .Heart: return "\u{F004}"
        case .HeartEmpty: return "\u{F08A}"
        case .Home: return "\u{F015}"
        case .Hospital: return "\u{F0F8}"
        case .Html5: return "\u{F13B}"
        case .Inbox: return "\u{F01C}"
        case .IndentLeft: return "\u{F03B}"
        case .IndentRight: return "\u{F03C}"
        case .InfoSign: return "\u{F05A}"
        case .Inr: return "\u{F156}"
        case .Instagram: return "\u{F16D}"
        case .Italic: return "\u{F033}"
        case .Jpy: return "\u{F157}"
        case .Key: return "\u{F084}"
        case .Keyboard: return "\u{F11C}"
        case .Krw: return "\u{F159}"
        case .Laptop: return "\u{F109}"
        case .Leaf: return "\u{F06C}"
        case .Legal: return "\u{F0E3}"
        case .Lemon: return "\u{F094}"
        case .Lessequal: return "\u{F500}"
        case .LevelDown: return "\u{F149}"
        case .LevelUp: return "\u{F148}"
        case .LightBulb: return "\u{F0EB}"
        case .Link: return "\u{F0C1}"
        case .Linkedin: return "\u{F0E1}"
        case .LinkedinSign: return "\u{F08C}"
        case .Linux: return "\u{F17C}"
        case .List: return "\u{F03A}"
        case .ListAlt: return "\u{F022}"
        case .LocationArrow: return "\u{F124}"
        case .Lock: return "\u{F023}"
        case .LongArrowDown: return "\u{F175}"
        case .LongArrowLeft: return "\u{F177}"
        case .LongArrowRight: return "\u{F178}"
        case .LongArrowUp: return "\u{F176}"
        case .Magic: return "\u{F0D0}"
        case .Magnet: return "\u{F076}"
        case .Male: return "\u{F183}"
        case .MapMarker: return "\u{F041}"
        case .Maxcdn: return "\u{F136}"
        case .Medkit: return "\u{F0FA}"
        case .Meh: return "\u{F11A}"
        case .Microphone: return "\u{F130}"
        case .MicrophoneOff: return "\u{F131}"
        case .Minus: return "\u{F068}"
        case .MinusSign: return "\u{F056}"
        case .MinusSignAlt: return "\u{F146}"
        case .MobilePhone: return "\u{F10B}"
        case .Money: return "\u{F0D6}"
        case .Move: return "\u{F047}"
        case .Music: return "\u{F001}"
        case .Off: return "\u{F011}"
        case .Ok: return "\u{F00C}"
        case .OkCircle: return "\u{F05D}"
        case .OkSign: return "\u{F058}"
        case .Ol: return "\u{F0CB}"
        case .PaperClip: return "\u{F0C6}"
        case .Paste: return "\u{F0EA}"
        case .Pause: return "\u{F04C}"
        case .Pencil: return "\u{F040}"
        case .Phone: return "\u{F095}"
        case .PhoneSign: return "\u{F098}"
        case .Picture: return "\u{F03E}"
        case .Pinterest: return "\u{F0D2}"
        case .PinterestSign: return "\u{F0D3}"
        case .Plane: return "\u{F072}"
        case .Play: return "\u{F04B}"
        case .PlayCircle: return "\u{F01D}"
        case .PlaySign: return "\u{F144}"
        case .Plus: return "\u{F067}"
        case .PlusSign: return "\u{F055}"
        case .PlusSquareO: return "\u{F196}"
        case .Print: return "\u{F02F}"
        case .Pushpin: return "\u{F08D}"
        case .PuzzlePiece: return "\u{F12E}"
        case .Qrcode: return "\u{F029}"
        case .Question: return "\u{F128}"
        case .QuestionSign: return "\u{F059}"
        case .QuoteLeft: return "\u{F10D}"
        case .QuoteRight: return "\u{F10E}"
        case .Random: return "\u{F074}"
        case .Refresh: return "\u{F021}"
        case .Remove: return "\u{F00D}"
        case .RemoveCircle: return "\u{F05C}"
        case .RemoveSign: return "\u{F057}"
        case .Renren: return "\u{F18B}"
        case .Reorder: return "\u{F0C9}"
        case .Repeat: return "\u{F01E}"
        case .Reply: return "\u{F112}"
        case .ReplyAll: return "\u{F122}"
        case .ResizeFull: return "\u{F065}"
        case .ResizeHorizontal: return "\u{F07E}"
        case .ResizeSmall: return "\u{F066}"
        case .ResizeVertical: return "\u{F07D}"
        case .Retweet: return "\u{F079}"
        case .Road: return "\u{F018}"
        case .Rocket: return "\u{F135}"
        case .Rss: return "\u{F09E}"
        case .Rub: return "\u{F158}"
        case .Save: return "\u{F0C7}"
        case .Screenshot: return "\u{F05B}"
        case .Search: return "\u{F002}"
        case .Share: return "\u{F045}"
        case .ShareAlt: return "\u{F064}"
        case .ShareSign: return "\u{F14D}"
        case .Shield: return "\u{F132}"
        case .ShoppingCart: return "\u{F07A}"
        case .SignBlank: return "\u{F0C8}"
        case .Signal: return "\u{F012}"
        case .Signin: return "\u{F090}"
        case .Signout: return "\u{F08B}"
        case .Sitemap: return "\u{F0E8}"
        case .Skype: return "\u{F17E}"
        case .Smile: return "\u{F118}"
        case .Sort: return "\u{F0DC}"
        case .SortByAlphabet: return "\u{F15D}"
        case .SortByAttributes: return "\u{F160}"
        case .SortByAttributesAlt: return "\u{F161}"
        case .SortByOrder: return "\u{F162}"
        case .SortByOrderAlt: return "\u{F163}"
        case .SortDown: return "\u{F0DD}"
        case .SortUp: return "\u{F0DE}"
        case .Spinner: return "\u{F110}"
        case .StackExchange: return "\u{F18D}"
        case .Stackexchange: return "\u{F16C}"
        case .Star: return "\u{F005}"
        case .StarEmpty: return "\u{F006}"
        case .StarHalf: return "\u{F089}"
        case .StarHalfEmpty: return "\u{F123}"
        case .StepBackward: return "\u{F048}"
        case .StepForward: return "\u{F051}"
        case .Stethoscope: return "\u{F0F1}"
        case .Stop: return "\u{F04D}"
        case .Strikethrough: return "\u{F0CC}"
        case .Subscript: return "\u{F12C}"
        case .Suitcase: return "\u{F0F2}"
        case .Sun: return "\u{F185}"
        case .Superscript: return "\u{F12B}"
        case .Table: return "\u{F0CE}"
        case .Tablet: return "\u{F10A}"
        case .Tag: return "\u{F02B}"
        case .Tags: return "\u{F02C}"
        case .Tasks: return "\u{F0AE}"
        case .Terminal: return "\u{F120}"
        case .TextHeight: return "\u{F034}"
        case .TextWidth: return "\u{F035}"
        case .Th: return "\u{F00A}"
        case .ThLarge: return "\u{F009}"
        case .ThList: return "\u{F00B}"
        case .ThumbsDownAlt: return "\u{F088}"
        case .ThumbsUpAlt: return "\u{F087}"
        case .Ticket: return "\u{F145}"
        case .Time: return "\u{F017}"
        case .Tint: return "\u{F043}"
        case .Trash: return "\u{F014}"
        case .Trello: return "\u{F181}"
        case .Trophy: return "\u{F091}"
        case .Truck: return "\u{F0D1}"
        case .Tumblr: return "\u{F173}"
        case .TumblrSign: return "\u{F174}"
        case .Twitter: return "\u{F099}"
        case .TwitterSign: return "\u{F081}"
        case .Ul: return "\u{F0CA}"
        case .Umbrella: return "\u{F0E9}"
        case .Underline: return "\u{F0CD}"
        case .Undo: return "\u{F0E2}"
        case .UniF1A0: return "\u{F1A0}"
        case .UniF1B1: return "\u{F1B0}"
        case .UniF1C0: return "\u{F1C0}"
        case .UniF1C1: return "\u{F1C1}"
        case .UniF1D0: return "\u{F1D0}"
        case .UniF1D1: return "\u{F1D1}"
        case .UniF1D2: return "\u{F1D2}"
        case .UniF1D5: return "\u{F1D5}"
        case .UniF1D6: return "\u{F1D6}"
        case .UniF1D7: return "\u{F1D7}"
        case .UniF1E0: return "\u{F1E0}"
        case .UniF1F0: return "\u{F1F0}"
        case .UniF280: return "\u{F280}"
        case .UniF281: return "\u{F281}"
        case .UniF285: return "\u{F285}"
        case .UniF286: return "\u{F286}"
        case .UniF2A0: return "\u{F2A0}"
        case .UniF2A1: return "\u{F2A1}"
        case .UniF2A2: return "\u{F2A2}"
        case .UniF2A3: return "\u{F2A3}"
        case .UniF2A4: return "\u{F2A4}"
        case .UniF2A5: return "\u{F2A5}"
        case .UniF2A6: return "\u{F2A6}"
        case .UniF2A7: return "\u{F2A7}"
        case .UniF2A8: return "\u{F2A8}"
        case .UniF2A9: return "\u{F2A9}"
        case .UniF2AA: return "\u{F2AA}"
        case .UniF2AB: return "\u{F2AB}"
        case .UniF2AC: return "\u{F2AC}"
        case .UniF2AD: return "\u{F2AD}"
        case .UniF2AE: return "\u{F2AE}"
        case .UniF2B0: return "\u{F2B0}"
        case .UniF2B1: return "\u{F2B1}"
        case .UniF2B2: return "\u{F2B2}"
        case .UniF2B3: return "\u{F2B3}"
        case .UniF2B4: return "\u{F2B4}"
        case .UniF2B5: return "\u{F2B5}"
        case .UniF2B6: return "\u{F2B6}"
        case .UniF2B7: return "\u{F2B7}"
        case .UniF2B8: return "\u{F2B8}"
        case .UniF2B9: return "\u{F2B9}"
        case .UniF2BA: return "\u{F2BA}"
        case .UniF2BB: return "\u{F2BB}"
        case .UniF2BC: return "\u{F2BC}"
        case .UniF2BD: return "\u{F2BD}"
        case .UniF2BE: return "\u{F2BE}"
        case .Unlink: return "\u{F127}"
        case .Unlock: return "\u{F09C}"
        case .UnlockAlt: return "\u{F13E}"
        case .Upload: return "\u{F01B}"
        case .UploadAlt: return "\u{F093}"
        case .Usd: return "\u{F155}"
        case .User: return "\u{F007}"
        case .UserMd: return "\u{F0F0}"
        case .Venus: return "\u{F221}"
        case .VimeoSquare: return "\u{F194}"
        case .Vk: return "\u{F189}"
        case .VolumeDown: return "\u{F027}"
        case .VolumeOff: return "\u{F026}"
        case .VolumeUp: return "\u{F028}"
        case .WarningSign: return "\u{F071}"
        case .Weibo: return "\u{F18A}"
        case .Windows: return "\u{F17A}"
        case .Wrench: return "\u{F0AD}"
        case .Xing: return "\u{F168}"
        case .XingSign: return "\u{F169}"
        case .Youtube: return "\u{F167}"
        case .YoutubePlay: return "\u{F16A}"
        case .YoutubeSign: return "\u{F166}"
        case .ZoomIn: return "\u{F00E}"
        case .ZoomOut: return "\u{F010}"
        }
    }
}
