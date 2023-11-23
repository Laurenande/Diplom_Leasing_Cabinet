//
//  PolicyIpAndFisVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 21.11.2023.
//

import UIKit

class PolicyIpAndFisVC: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .systemGray6
        scroll.overrideUserInterfaceStyle = .light
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.overrideUserInterfaceStyle = .light
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let labelInfo: UILabel = {
        let label = UILabel()
        label.textColor = .black
        //label.font = .boldSystemFont(ofSize: 14)
        label.font = .systemFont(ofSize: 14)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var segmentControl : UISegmentedControl = {
        let segmentItems = ["Политика ", "Юр. лицо", "Физ. лицо"]
        let segment = UISegmentedControl(items: segmentItems)
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    private var textdd: String = "asdd"
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            setText()
            labelInfo.text = textdd
            break
        case 1:
            setTextUr()
            labelInfo.text = textdd
            break
        case 2:
            setTextFis()
            labelInfo.text = textdd
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        navigationController?.overrideUserInterfaceStyle = .light
        //navigationItem.titleView?.overrideUserInterfaceStyle = .light
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeView(_: )))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(closeView(_: )))
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(segmentControl)
        contentView.addSubview(labelInfo)
        labelInfo.text = textdd
        view.backgroundColor = .systemGray6
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    @objc func closeView(_ sender: Any){
        print("sad")
        
        dismiss(animated: true)
    }
    
    
    
}
extension PolicyIpAndFisVC{
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            segmentControl.topAnchor.constraint(equalTo: contentView.topAnchor),
            segmentControl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            labelInfo.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 30),
            labelInfo.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            labelInfo.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            labelInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
            
        ])
    }
    func setText() {
        textdd = "О порядке использования сайта ООО «ТЕХНО Лизинг» (tehnoleasing.ru),раздела сайта (интернет-страницы) «Кабинет агента»\n\nНастоящее Пользовательское соглашение (далее – «Соглашение») разработано ООО «ТЕХНО Лизинг» (далее также – Компания, Общество, Принципал) и определяет условия использования интернет-страницы «Кабинет агента» интернет-сайта tehnoleasing.ru, а также права и обязанности его Пользователей (далее также – Агентов) и Компании (далее при совместном упоминании – «Стороны»).\nЗарегистрировавшись на интернет-странице, в личном кабинете посредством Сайта https://tehnoleasing.ru/agent, а также воспользовавшись любой функциональной возможностью сайта, страницы, Пользователь выражает свое безоговорочное согласие по принятию данного Соглашения. Соглашение действительно в электронной форме (электронный документ).\n\nРегистрация лица в качестве Пользователя, Агента на интернет-странице, в личном кабинете (Кабинете Агента) посредством Сайта https://tehnoleasing.ru/agent означает заключение договора присоединения об оказании услуг по поиску клиентов (является Приложением к настоящему Соглашению). Договор об оказании услуг по поиску клиентов не является письменной публичной офертой Компании в соответствии со ст. 437 ГК РФ, Компания вправе по своему усмотрению отказать в заключении Договора без объяснения причин такого отказа.\n\nС момента заключения (принятия условий) пользовательского соглашения и договора об оказании услуг по поиску клиентов, Агент получает доступ к полному функционалу Кабинета агента.\nАгент несет ответственность за достоверность и полноту информации и документов, предоставленных Компании или размещенных в Кабинете агента, и самостоятельно несет риск наступления последствий в случае предоставления неполной и/или недостоверной информации, документов.\n\nНастоящее Пользовательское соглашение и иные документы, правила, договоры Компании, размещенные на сайте Компании, в Кабинете агента, являются обязательными для Пользователей, Агентов.\n\n1. ТЕРМИНЫ И ОПРЕДЕЛЕНИЯ\nКомпания (Принципал, Общество) – Общество с ограниченной ответственностью «ТЕХНО Лизинг» (ИНН 7723609647, ОГРН 5077746561217, юридический адрес: 121357, г. Москва, ул. Кременчугская, д. 6, корп. 2, стр. 1, эт. 3, комн. 4).\nСайт – сайт в сети «Интернет», располагающийся по адресу - tehnoleasing.ru, принадлежащий Компании.\nКабинет агента – раздел сайта, в котором Пользователь регистрируется в качестве агента с целью оказания Компании как Принципалу агентских услуг по поиску и привлечению лиц, желающих заключить с Компанией договор финансовой аренды (лизинга).\nПользователь – любое лицо, принявший условия настоящего Соглашения в полном объеме и соответствующее его требованиям и требованиям Компании, потенциальный Агент, прошедший первоначальную регистрацию в соответствующем разделе Сайта.\nАгент – Пользователь, предоставивший полные данные, прошедший полную регистрацию в соответствующем разделе сайта и являющийся стороной договора об оказании услуг по поиску клиентов, заключенного этим лицом с Компанией путем присоединения, по которому Агент обязуется за вознаграждение совершить по поручению Компании (принципала) юридические и иные действия, а именно: поиск и привлечение потенциальных клиентов, желающих заключить с Компанией договор финансовой аренды (лизинга) в качестве лизингополучателей.\nДоговор оказания услуг по поиску клиентов (далее также Договор) – договор, заключаемый между Компанией и Агентом (путем присоединения), согласно которому Компания поручает, а Агент за вознаграждение берет на себя обязательство совершать юридические и иные действия, а именно: поиск и привлечение потенциальных клиентов, желающих заключить с Обществом договор финансовой аренды (лизинга) в качестве лизингополучателей.\nИнформация, предоставляемая Пользователем/Агентом – документы и сведения, содержащие различную информацию о Пользователе/Агенте, а также о третьих лицах (физических и юридических лицах), в том числе персональные данные таких лиц.\nПерсональные данные – любая информация, относящаяся к прямо или косвенно определенному или определяемому физическому лицу (субъекту персональных данных).\n«Cookies» — небольшой фрагмент данных, отправленный веб-сервером и хранимый на компьютере пользователя, который веб-клиент или веб-браузер каждый раз пересылает веб-серверу в HTTP-запросе при попытке открыть страницу соответствующего сайта. Типы cookies-файлов: - сеансовые cookies – временные файлы, хранение которых на компьютере Пользователя прекращается по окончанию сессии, когда веб-браузер закрыт или Пользователь покинул сайт; - постоянные cookies - временные файлы, хранение которых на компьютере Пользователя прекращается по истечению установленного срока «годности» файла или пока не будут удалены Пользователем.\n«IP-адрес» — уникальный сетевой адрес узла в компьютерной сети, построенной по протоколу IP.\n\n2. РЕГИСТРАЦИЯ И АВТОРИЗАЦИЯ ПОЛЬЗОВАТЕЛЯ\n2.1. Для начала работы в Кабинете агента, лицо, намеренное стать Агентом Компании и заключить договор на оказание услуг по поиску клиентов, должно зарегистрироваться в соответствующем разделе сайта Компании – Кабинете агента, предоставив Компании свои данные: «логин» - идентификатор пользователя (в виде Фамилии и имени) и номер мобильного телефона, для входа и работы в Кабинете агента в качестве Пользователя.\nПри регистрации Пользователю на указанный им при регистрации номер телефона приходит код подтверждения – SMS-ключ (трехзначное или более- число или буквенно-числовое сочетание), который Пользователь должен ввести в соответствующую графу, тем самым подтвердить данные, указанные при регистрации и завершить регистрацию.\nТакая регистрация позволит Пользователю осуществлять вход в Личный кабинет агента, ознакомиться с функционалом Кабинета агента, а также размещать, сохранять документы и сведения потенциального клиента с целью определения Компанией возможности заключения с таким клиентом Договора финансовой аренды (лизинга). \nОсуществляя регистрацию для начала работы в Кабинете агента и предоставляя свои данные, Пользователь выражает согласие на обработку Компанией его персональных данных.\n\n2.2. Для получения возможности полноценного использования Кабинета Агента, Пользователь обязан предоставить полную информацию, необходимую для идентификации, проверки Пользователя на предмет его соответствия требованиям законодательства и правилам Компании. Предоставление полной информации и данных Пользователя производится путем заполнения всех обязательных полей регистрационной формы и приложения цифровых образов документов и пр.\nПользователь может получить статус Агента только после полной регистрации и заключения Договора об оказании услуг по поиску клиентов (путем присоединения/подачи заявления на присоединение к договору).\nПроизводя полную регистрация и предоставляя свои персональные данные, Пользователь, Агент выражает свое согласие на обработку Компанией его персональных данных. Срок такого согласия – неопределенный. Согласие может быть отозвано по личному заявлению Пользователя, Агента.\nПри совершении регистрации в Кабинете агента, Компания осуществляет проверку данных Пользователя, Агента. При проведении такой проверки Компания вправе по своему усмотрению запросить предоставления отдельных документов или сведений.\nИнформация, запрашиваемая Компанией на этапе регистрации необходима Компании для проведения идентификации, проверки и установления соответствия Пользователя требованиям закона и требованиям Компании.\nНа основании результатов такой проверки Компания принимает решение о заключении или отказе в заключении Договора оказания услуг по поиску клиентов с Пользователем, и дальнейшем использовании таким Пользователем сайта Компании.\nПосле принятия положительного решения Компанией о заключении с Пользователем Договора оказания услуг по поиску клиентов, Пользователю присваивается статус Агента и он получает право полноценного использования Кабинета агента и соответствующих разделов сайта Компании.\nВ случае принятия Компанией решения об отказе в заключении Договора оказания услуг и присвоения статуса Агента, Пользователь не приобретает права на использование соответствующего раздела сайта и Кабинета агента.\nВ случае, если при проведении проверки Компанией были запрошены дополнительные документы или сведения от Пользователя, принятие решения о присвоении статуса Агента или об отказе в этом, откладывается до момента получения запрошенных документов, сведений и до принятия соответствующего решения Компанией.\nРегистрационная форма Сайта может запрашивать у пользователя дополнительную информацию, в зависимости от потребности Компании.\nВ случае верного последовательного выполнения всех регистрационных действий, на Сайте создается Кабинет агента, которая может иметь уникальный сетевой адрес. Пользователь вправе зарегистрировать не более одного Кабинета агента.\n2.3. Агентом может быть юридическое лицо, созданное в соответствии с законодательством РФ, индивидуальный предприниматель, зарегистрированный в соответствии с законодательством РФ, физическое лицо, являющееся гражданином РФ, достигшее 18- летнего возраста и обладающее полной дееспособностью.\n2.4. Заключение Договора оказания услуг по поиску клиентов осуществляется путем подписания Пользователем заявки на присоединение к Договору с использованием простой электронной подписи. При подаче заявке Пользователем может использоваться усиленная квалифицированная подпись, в случае ее наличия у Пользователя.\n\n3. ПРЕДМЕТ СОГЛАШЕНИЯ\n3.1. Компания на безвозмездной основе предоставляет доступ к Сайту и Кабинету агента Пользователям, а Пользователь в свою очередь по умолчанию гарантирует, что предоставляемая Компании с помощью Сайта Информация, в том числе персональные данные, предоставляется Компании при наличии согласия Пользователя или с согласия третьих лиц.\n3.2. Пользователь/Агент гарантирует, что Информация, предоставленная Компании с помощью Сайта, в том числе относящаяся к персональным данным, является полной, точной и достоверной во всех отношениях.\nПользователь/Агент подтверждает, что представленная информация соответствует действительности, не возражает против проверки ее достоверности, в том числе с использованием услуг других операторов.\nПользователь/Агент подтверждает и гарантирует, что получены все необходимые согласия лиц о предоставлении (передаче, сообщении и пр.) ООО «ТЕХНО Лизинг» (и иным третьим лицам, уполномоченными ООО «ТЕХНО Лизинг» и/или с которыми у ООО «ТЕХНО Лизинг» установлены гражданско-правовые отношения) информации о них, в том числе относящейся к персональным данным физических лиц.\nНастоящим Пользователь/Агент признает и подтверждает, что настоящее согласие считается данным любым третьим лицам, уполномоченными ООО «ТЕХНО Лизинг» и/или с которыми у ООО «ТЕХНО Лизинг» установлены гражданско-правовые отношения, и такие третьи лица имеют право на обработку предоставленных данных на основании настоящего согласия при условии соблюдения ограничений относительно допустимых целей их обработки.\n\n4. ПРАВА И ОБЯЗАННОСТИ СТОРОН\n4.1. Пользователи/Агенты вправе:\n4.1.1. Использовать инструменты Сайта и Кабинета агента с целью последующих поиска и привлечения потенциальных клиентов для Компании.\n4.1.2. Обращаться к Компании с предложениями по улучшению работы Сайта, Кабинета агента в целом и отдельных его сервисов в частности.\n4.1.3. Просить разъяснений от Компании в случае, если с точки зрения Пользователя/Агента, Компания неправомерно заблокировала его учетную запись или ограничила доступ к сервисам Сайта/Кабинета агента.\n4.1.4. Обращаться к Компании с жалобами на других Пользователей/Агентов, в случае если их действия нарушают положения настоящего Соглашения.\n4.2. Пользователи/Агенты обязаны:\n4.2.1. До момента регистрации на Сайте ознакомиться с текстом данного Соглашения, а также периодически проверять наличие изменений Соглашения и его приложений. Настоящее Соглашение может быть изменено и/или дополнено Компанией в одностороннем порядке без какого-либо специального уведомления. Настоящее Соглашение является открытым и общедоступным документом. Компания рекомендует Пользователям/Агентам регулярно проверять условия настоящего Соглашения на предмет его изменения и/или дополнения. Продолжение использования Сайта/Кабинета агента Пользователем/Агентом после внесения изменений и/или дополнений в настоящее Соглашение означает принятие и согласие Пользователя/Агента с такими изменениями и/или дополнениями.\n4.2.2. В случае изменения персональных/идентификационных данных, указанных при регистрации, Пользователь/Агент обязуется уведомить об этом Компанию путем внесения изменений в личном кабинете (или ином специальном разделе сайта), в письменном виде или по электронной почте info@tehnoleasing.ru в течение 7 (семи) календарных дней с момента изменения. В противном случае Компания не несет ответственности за получение Пользователем/Агентом какой-либо информации, для которой необходимы эти данные, а равно совершения/несовершения действий в пользу или в отношении Пользователя/Агента.\n4.2.3. Незамедлительно сообщить о любой несанкционированной попытке доступа к своему Кабинету агента, а также об утрате логина и пароля (в случае его установления) по электронной почте info@tehnoleasing.ru. Если Пользователем/Агентом не доказано обратное, любые действия, совершенные с использованием его логина и пароля, считаются совершенными соответствующим Пользователем/Агентом.\n4.2.4. При регистрации на Сайте (создании Кабинета агента) Пользователь обязан предоставить Компании необходимую, достоверную и актуальную информацию для формирования Кабинета агента (Персональная страница Пользователя), включая уникальные для каждого Пользователя логин/пароль доступа к Кабинету или логин/sms-подтверждение (в зависимости от функции Сайта/Страницы сайта.\n4.2.5. Предоставлять информацию о третьих лицах (потенциальных клиентах) с соблюдением Законодательства РФ.\n4.2.6. Пользователь соглашается не предпринимать действий, которые могут рассматриваться как нарушающие российское законодательство или нормы международного права, в том числе в сфере интеллектуальной собственности, авторских и/или смежных правах, а также любых действий, которые приводят или могут привести к нарушению нормальной работы Сайта, сервисов Сайта и Кабинета агента.\n4.2.7. Пользователь предупрежден о том, что Компания не несет ответственности за посещение и использование им внешних ресурсов, ссылки на которые могут содержаться на сайте.\n4.2.8. Пользователь принимает положение о том, что все материалы и сервисы Сайта или любая их часть могут сопровождаться рекламой. Пользователь согласен с тем, что Компания не несет какой-либо ответственности и не имеет каких-либо обязательств в связи с такой рекламой.\n4.3. Компания вправе:\n4.3.1. В любое время изменять оформление Сайта/Кабинета агента, его содержание, список сервисов, изменять или дополнять используемые скрипты, программное обеспечение и другие объекты, используемые или хранящиеся на Сайте/Кабинете агента, любые серверные приложения с предварительным уведомлением или без такового.\n4.3.2. Удалять Кабинет агента Пользователя/Агента, что означает автоматическое удаление всей информации, размещенной в нем, а также всей информации Пользователя/Агента, введенной при регистрации на Сайте. После удаления персональной страницы Пользователь теряет права доступа к Сайту/Кабинету агента.\n4.3.3. Распоряжаться статистической информацией, связанной с функционированием Сайта/Кабинета агента, а также информацией Пользователей/Агентов для обеспечения адресного показа рекламной информации различным аудиториям Пользователей Сайта. Для целей организации функционирования и технической поддержки Сайта, а также исполнения настоящих правил, Компания имеет техническую возможность доступа к Кабинетам агентов, которую реализует только в случаях, установленных настоящим Соглашением.\n4.3.4. Направлять Агенту информацию о развитии Сайта/Кабинета агента и его сервисов, а также рекламировать собственную деятельность и Услуги.\n4.3.5. Размещать на Сайте рекламу, в том числе внедрять ее в контент, размещенный Пользователями/Агентами.\n4.3.6. По своему усмотрению ограничить доступ к любой информации, размещенной Пользователем/Агентом; удалить информацию, размещенную Пользователем/Агентом, а также учетную запись Пользователя/Агента. Удаление Кабинета Агента (учетной записи) может быть произведено Компанией в случае нарушения Пользователем/Агентом условий, указанных в п. 4.2.4, 4.2.5, 4.2.6. настоящего соглашения и/или совершения иных действий, в результате которых Компании причинен ущерб, в том числе репутационный, или Агентом допущено нарушение прав Компании. Удаление Кабинета агента означает прекращение каких-либо отношений Компании и Пользователя/Агента.\n4.3.7. Отказать в регистрации Пользователю, учетная запись которого была ранее удалена за нарушение условий Соглашения.\n4.4. Компания обязана:\n4.4.1. Обеспечивать функционирование и работоспособность Сайта/Кабинета агента и оперативно восстанавливать его работоспособность в случае технических сбоев и перерывов.\n4.4.2. Осуществлять защиту учетной записи Пользователя/Агента от неправомерного доступа, уничтожения размещенной Пользователем/Агентом информации, а также от иных неправомерных действий в отношении такой информации всеми находящимися в ее распоряжении техническими средствами.\n\n5. ЛИЧНЫЙ КАБИНЕТ АГЕНТА\n5.1. Для каждого зарегистрированного Пользователя на сайте Компании создается Личный кабинет агента, в котором отображается информация о Пользователе/Агенте, его действиях, статусе заявок на заключение потенциальными клиентами с Компанией договора финансовой аренды (лизинга), оказанных Агентом услугах и выплатах Агенту.\n5.2. В Личном кабинете агента содержаться электронные документы или цифровые образы документов, подтверждающие действия Агента или относящиеся к заявке потенциального клиента.\n5.3. В Личном кабинете агента может содержаться форма обратной связи Агента с Компанией.\n5.4. При заключении Компанией договора финансовой аренды (лизинга) с клиентом, привлеченным Агентом, в Личном кабинете агента отражается статус такого договора, а также сумма вознаграждения Агента, полагающаяся Агенту к выплате.\n\n6. ОТВЕТСТВЕННОСТЬ\n6.1. При неисполнении или ненадлежащем исполнении Сторонами обязательств, принятых на себя в соответствии с настоящим Соглашением, стороны несут ответственность в соответствии с действующим законодательством РФ.\n6.2. За ущерб, причиненный Стороне, другая Сторона несет ответственность в полном размере в соответствии с действующим законодательством РФ.\n\n7. ПРОЧИЕ УСЛОВИЯ\n7.1. Ничто в Соглашении не может пониматься как установление между Пользователем и Компанией агентских отношений, отношений товарищества, отношений по совместной деятельности, отношений личного найма, либо каких-то иных отношений, прямо не предусмотренных Соглашением.\n7.2. Использование материалов и сервисов Сайта и Кабинета агента регулируется нормами действующего законодательства РФ.\n7.3. Все возможные споры, вытекающие из настоящего Соглашения или связанные с ним, подлежат разрешению в соответствии с действующим законодательством Российской Федерации.\n7.4. Компания вправе в любое время в одностороннем порядке изменять условия настоящего Соглашения. Такие изменения вступают в силу с момента размещения новой версии Соглашения на сайте. При несогласии Пользователя с внесенными изменениями он обязан отказаться от доступа к Сайту, прекратить использование материалов и сервисов Сайта.\n\n8. ЭЛЕКТРОННЫЙ ДОКУМЕНТООБОРОТ\n8.1. Настоящее Пользовательское соглашение устанавливает признание Сторонами (Пользователем, Агентом и Компанией) использование Простой электронной подписи (ПЭП) или Квалифицированной электронной подписи (КЭП) (при ее наличии у Пользователя) при электронном взаимодействии между сторонами.\n8.2. Признание использования Простой электронной подписи при электронном взаимодействии, в том числе при заключении Договора на оказание услуг по поиску клиентов, является обязательным условием присоединения к настоящему Соглашению. Регистрируясь в качестве Пользователя/Агента на сайте, при регистрации Кабинета агента, Пользователь подтверждает, что ознакомлен с условием об электронном документообороте и безоговорочно с ним согласен.\n8.3. Лицо, создающее электронный документ в Кабинете агента и подписывающее такой документ ПЭП, определяется как лицо, зарегистрированное в соответствующем разделе Сайта, Кабинете агента как Пользователь или Агент, авторизованное Компанией/Сайтом, которому принадлежит номер мобильного телефона, использованный при регистрации/авторизации на Сайте.\n8.4. В целях генерации кода ПЭП и подписания электронного документа Сайт (Компания) направляет Пользователю специальный одноразовый цифровой код подтверждения - SMS-ключ, который направляется Пользователю/Агенту посредством смс-сообщения на номер мобильного телефона, указанный при регистрации.\n8.5. Простая электронная подпись содержится в коде самого электронного документа (в электронном документе) и подтверждает подписание такого электронного документа Пользователем/Агентом. Электронный документ содержит информацию, указывающую на лицо, создавшее и/или отправившее электронный документ.\n8.6. Электронный документ, подписанный Пользователем/Агентом простой ЭП, признается документом, подписанным собственноручно.\n8.7. Проверка ПЭП, которой подписан документ, осуществляется программно-техническим комплексом Сайта путем сверки данных кода ПЭП с данными, содержащимися в системе генерации SMS-ключей с проверкой совпадения ID Пользователя/Агента.\n\n9. УСЛОВИЯ ИСПОЛЬЗОВАНИЯ COOKIES-файлов\n6.1. Cookie-файл – файл, содержащий небольшой объем данных, который отправляется веб-сайтом (Сайтом Компании) и хранится на компьютере Пользователя.\n6.2. Cookies-файлы используются для настройки содержания сайта с предпочтениями Пользователя, поддержания сеанса после входа в систему, создания статистики в целях улучшения веб-сайта.\n6.3. Компания на своем сайте использует следующие виды cookies: - используемые в целях безопасности; - используемые в целях записи параметров и настроек интерфейса пользователя.\n6.4. Во многих случаях веб-браузеры позволяют cookies хранится на компьютере Пользователю по умолчанию. Настройки браузера, касающиеся хранения и работы с файлами cookies, могут быть изменены Пользователем.\n6.5. Ограничение в использование cookies файлов может отразиться на эффективности пользования сайтом Компании.\n6.6. Файлы cookies, отправленные с сайта Компании, могут также быть использованы сайтами компаний-партнеров."
    }
    
    
    func setTextUr() {
        textdd = "Информация, предоставленная мной/нами ООО «ТЕХНО Лизинг» в связи с установлением договорных отношений, является полной, точной и достоверной во всех отношениях.\nНастоящим подтверждаем, что представленная информация соответствует действительности, не возражаем против проверки ее достоверности, в том числе с использованием услуг других операторов (третьих лиц), а также использовать информацию о неисполнении и/или ненадлежащем исполнении договорных обязательств, в случае их возникновения, в том числе при рассмотрении вопросов о предоставлении новых разработанных компанией продуктах и заключении новых договоров.\nМы подтверждаем, что получены все необходимые согласия лиц о предоставлении (передаче, сообщении, распространении, обработке и пр.) ООО «ТЕХНО Лизинг» (и иным третьим лицам, уполномоченными ООО «ТЕХНО Лизинг» и/или с которыми у ООО «ТЕХНО Лизинг» установлены гражданско-правовые отношения) информации о них, в том числе относящейся к персональным данным физических лиц.\nВ случае разработки ООО «ТЕХНО Лизинг» новых продуктов и услуг, настоящим выражаем свое согласие на информирование нас об этих продуктах и услугах, в том числе, но не ограничиваясь, с использованием почтовой, телефонной, факсимильной связи, электронной почты и пр.\nМы согласны с тем, что предоставленный в ООО «ТЕХНО Лизинг» пакет документов останется в ООО «ТЕХНО Лизинг».\nМы извещены о том, что ООО «ТЕХНО Лизинг» имеет право отказать в заключении соответствующего договора без объяснения причин отказа.\nНе возражаем против предоставления переданной/сообщенной нами информации банкам (кредитным организациям), в которых у ООО «ТЕХНО Лизинг» открыт расчетный счет. Также настоящим признаем и подтверждаем, что настоящее согласие считается данным любым третьим лицам, уполномоченными ООО «ТЕХНО Лизинг» и/или с которыми у ООО «ТЕХНО Лизинг» установлены гражданско-правовые отношения, и такие третьи лица имеют право на обработку предоставленных данных на основании настоящего согласия при условии соблюдения ограничений относительно допустимых целей их обработки.\nВ соответствии с ФЗ № 218 от 30.12.2004 «О кредитных историях» настоящим также даем ООО «ТЕХНО Лизинг» согласие на получение из любого бюро кредитных историй информации/кредитных отчетов об организации для целей принятия решений о целесообразности установления договорных отношений, проверки финансовой устойчивости клиента в период действия настоящего согласия; настоящее согласие считается действительным в течении 6 (шести) месяцев со дня его оформления.\nВ случае изменения сведений, указанных и переданных нами ООО «ТЕХНО Лизинг» в течение действия договорных отношений, обязуемся в 3-хдневный срок сообщить в ООО «ТЕХНО Лизинг» о произошедших изменениях."
    }
    
    func setTextFis() {
        textdd = "Информация, предоставленная мной ООО «ТЕХНО Лизинг» в связи с установлением договорных отношений, является полной, точной и достоверной во всех отношениях.\nНастоящим подтверждаю, что представленная информация соответствует действительности, не возражаю против проверки ее достоверности, в том числе с использованием услуг других операторов (третьих лиц), а также использовать информацию о неисполнении и/или ненадлежащем исполнении договорных обязательств, в случае их возникновения, в том числе при рассмотрении вопросов о предоставлении новых разработанных компанией продуктах и заключении новых договоров.\nВ случае разработки ООО «ТЕХНО Лизинг» новых продуктов и услуг, настоящим выражаю свое согласие на информирование меня (или моего представителя) об этих продуктах и услугах, в том числе, но не ограничиваясь, с использованием почтовой, телефонной, факсимильной связи, электронной почты и пр.\nНастоящим выражаю согласие с тем, что предоставленный в ООО «ТЕХНО Лизинг» пакет документов останется в ООО «ТЕХНО Лизинг».\nНастоящим подтверждаю, что извещен о том, что ООО «ТЕХНО Лизинг» имеет право отказать в заключении соответствующего договора без объяснения причин отказа.\nНе возражаю против предоставления переданной/сообщенной информации банкам (кредитным организациям), в которых у ООО «ТЕХНО Лизинг» открыт расчетный счет. Также настоящим признаю и подтверждаю, что настоящее согласие считается данным любым третьим лицам, уполномоченными ООО «ТЕХНО Лизинг» и/или с которыми у ООО «ТЕХНО Лизинг» установлены гражданско-правовые отношения, и такие третьи лица имеют право на обработку предоставленных данных на основании настоящего согласия при условии соблюдения ограничений относительно допустимых целей их обработки.\nВ соответствии с ФЗ № 218 от 30.12.2004 «О кредитных историях» настоящим также даю ООО «ТЕХНО Лизинг» согласие на получение из любого бюро кредитных историй информации/кредитных отчетов обо мне для целей принятия решений о целесообразности установления договорных отношений, проверки финансовой устойчивости в период действия настоящего согласия; настоящее согласие считается действительным в течении 6 (шести) месяцев со дня его оформления.\nВ случае изменения сведений, указанных и переданных мной ООО «ТЕХНО Лизинг» в течение действия договорных отношений, обязуюсь в 3-хдневный срок сообщить в ООО «ТЕХНО Лизинг» о произошедших изменениях.\nНастоящим даю свое согласие ООО «ТЕХНО Лизинг» (121357, г. Москва, ул. Кременчугская, д. 6, корп. 2, стр. 1, эт. 3, комн. 4, ИНН 7723609647, ОГРН 5077746561217) на обработку моих персональных данных, включая их получение от меня и/или от любых третьих лиц, с учетом требований действующего законодательства РФ, и подтверждаю, что, давая такое согласие, я действую своей волей и в своем интересе.\nСогласие дается мною на обработку ООО «ТЕХНО Лизинг» следующей информации: мои фамилия, имя, отчество, год, месяц, дата и место рождения, адрес, номер телефона, семейное, социальное, имущественное положение, образование, профессия, доходы, и любая иная информация, относящаяся к моей личности, доступная, либо известная в любой конкретный период времени ООО «ТЕХНО Лизинг» (далее — «Персональные данные»), предусмотренная Федеральным законом № 152-ФЗ от 27.07.2006г. «О персональных данных». Согласие дано для целей исполнения договорных обязательств, в случае возникновения таковых.\nНастоящее согласие дается на неопределенный срок и может быть мною отозвано, но не ранее даты прекращения договорных обязательств, в случае, если таковые возникнут между сторонами. Порядок отзыва согласия — по личному заявлению. При этом ООО «ТЕХНО Лизинг» имеет право хранить мои персональные данные в течение срока хранения документов, установленного действующим законодательством РФ, а в случаях, предусмотренных законодательством РФ, передавать уполномоченным органам государственной власти.\nНастоящее согласие дается мною ООО «ТЕХНО Лизинг» на осуществление любых действий в отношении моих персональных данных, в том числе: сбор, запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), извлечение, использование, передачу (предоставление, доступ), распространение, обезличивание, блокирование, удаление, уничтожение, трансграничную передачу Персональных данных, а также осуществление любых иных действий с моими Персональными данными с учетом действующего законодательства. Настоящим выражаю свое согласие на проверку ООО «ТЕХНО Лизинг» достоверности представленных мною персональных данных, в том числе с использованием услуг других операторов."
        
        
    }
}

