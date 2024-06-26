//
//  DataManager.swift
//  HW5
//
//  Created by Vyacheslav on 06.05.2024.
//

import Foundation

protocol IDataManager {
    static func createMockData() -> [HeroesListModel]
}

class DataManager: IDataManager {
    
     static func createMockData() -> [HeroesListModel] {
        return [
            HeroesListModel(
                heroNameImage: "invokerImage",
                heroName: "Invoker",
                heroPosition: .midLine,
                heroStrength: 19,
                heroAgility: 14,
                heroIntelligence: 19,
                description: """
        Магия в своей самой ранней, даже можно сказать, самой мощной форме, всегда являлась в основном искусством памяти. Она не требовала техник, палочек или других принадлежностей, за исключением разума самого чародея. Всё, что ему было нужно — мнемонические средства, помогающие колдующему вспомнить в полных деталях ту психологическую формулу, что раскроет магическую силу.
        
        Величайшие волшебники тех дней были одарены отличной памятью, а сами заклинания были настолько сложны и громоздки, что чародеи были вынуждены на чем-то специализироваться. Однако даже самые отличные волшебники могли надеяться лишь на то, что они они запомнят за всю свою жизнь три-четыре заклинания, не более. Обычные маги знали всего два заклинания, так что это не такое уж и необычное явление, когда деревенский чародей знал только одно заклинание, да и то требовало титанических усилий, куч подсказок и инструкций, работающих, как лекарство от забывчивости, в те редкие случаи, когда это самое заклинание просили продемонстрировать.
        
        Но среди всех этих волшебников было всего одно, но гениальное и владеющее огромной памятью исключение, и имя ему — Invoker. Уже в своей юности взрослый не по годам волшебник сумел набить руку на использовании не четырёх, не пяти, и даже не семи, а не менее десятка заклинаний, которые он сотворял практически мгновенно! Ещё больше он уже и так знал, но просто считал бесполезными. Одно из его заклинаний — Sempiternal Cantrap — было такой огромной мощи, что следы от его использования в первые дни создания мира видны до сих пор (или просто расщеплены на атомы).
        
        Большинство почти-бессмертных живут тихо, пряча от мира свой секрет, но Invoker — отнюдь не тот, кто хранит свой дар в кладовке. Он — древний, знающий гораздо больше остальных, разум которого все ещё имеет свободное место для рассуждений о смысле существования... как и для колдовства, которым он развлекает себя, наблюдая за последними днями этого мира
        """,
                complexity: .veryHard),
            
            HeroesListModel(
                heroNameImage: "tinkerImage",
                heroName: "Tinker",
                heroPosition: .midLine,
                heroStrength: 19,
                heroAgility: 17,
                heroIntelligence: 30,
                description: """
        Карликовый народец, которому принадлежит Боуш, известен своими изобретательностью, хитростью и нелюбовью к магии. Гордятся они, что зарабатывают себе на хлеб исключительно разумом, применяя лишь те силы природы, которым могут найти объяснение. Но даже такая сдержанность может обернуться трагедией — уж Боушу ли не знать. Когда-то он был одним из главных исследователей законов природы, основателем подземной лаборатории всего и вся, расположенной под окутанным туманами Фиолетовым плато. Презирая магов за опасность, которую те представляют для мира, Боуш и его помощники, не ведая об опасности, открыли портал в некий мир за гранью разумения и оказались во власти собственных кошмаров. Чёрный туман покрыл Фиолетовое плато вечной тьмой, откуда теперь доносятся полные ужаса звуки. Только благодаря всяким штуковинам собственного изобретения Боушу удалось бежать. Один он пережил беду Фиолетового плато.
        """,
                complexity: .hard),
            
            HeroesListModel(
                heroNameImage: "voidSpiritImage",
                heroName: "Void Spirit",
                heroPosition: .midLine,
                heroStrength: 21,
                heroAgility: 19,
                heroIntelligence: 24,
                description: """
Даже другие духи не понимают стремлений и замыслов их старшего брата Иная, духа пустоты. Он хранит секреты, которые могут расколоть сознание смертного, и наблюдает за мановениями вселенной с непостижимой прозорливостью, оставляя подготовленным слугам исполнять его волю; и только если он решит, что больше никто не сможет направить реальность на верный путь, он покинет Сокрытый храм и переместится в материальный мир.

Инай видит перед собой всё сущее, но его взгляд прикован к тому моменту времени, в котором столкнётся множество реальностей — грядущее ему неведомо. Теперь же он материализуется из небытия, чтобы лично решить исход битвы Древних и подготовить своих союзников к более важному противостоянию.
""",
                complexity: .medium),
            
            HeroesListModel(
                heroNameImage: "stormSpiritImage",
                heroName: "Storm Spirit",
                heroPosition: .midLine,
                heroStrength: 21,
                heroAgility: 22,
                heroIntelligence: 23,
                description: """
Райдзин Громокег — сила природы в самом буквальном смысле: это буйная энергия ветра и непогоды, заключённая в человеческом обличье. Как же он неистов, неудержим и задорен! Весёлый, словно любимый дядюшка, Райдзин заряжает всё вокруг своей искрящейся энергией. Но не всегда всё было именно так: начало его жизни положила трагедия. Много поколений назад, на плато за Скулящими горами, добрые люди страдали от голода и засухи. Обычный маг стихий Громокег запретным заклинанием призвал духа бури, умоляя его о дожде. Разгневанный дерзостью смертного, небесный Райдзин обрушил на землю потопы и ураганы. Громокег не мог противостоять духу, пока не произнёс самоубийственное заклятье, сковавшее их судьбы: он запер небесного духа в клетке собственного тела. С тех пор громогласный Райдзин и задорный Громокег навсегда стали жизнерадостным небожителем, ступающим по земле — и имя ему Райдзин Громокег.
""",
                complexity: .medium),
            
            HeroesListModel(
                heroNameImage: "lionImage",
                heroName: "Lion",
                heroPosition: .support,
                heroStrength: 18,
                heroAgility: 15,
                heroIntelligence: 20,
                description: """
Некогда Великий магистр демонологии заслужил известность среди своих собратьев, сражаясь на стороне света и справедливости. Но лесть испортила его. Силы мага превосходило лишь его же честолюбие, и демон завлёк его на тёмную сторону, выменяв душу магистра на уважение других. Запятнав душу ужасными преступлениями, маг остался в одиночестве: демон предал его и стал искать выгоды у врагов. Ярость демонолога погнала его за предателем в самый ад, где, отрывая конечность за конечностью, он жестоко расправился с демоном и забрал себе его демоническую руку. Оказалось, что демонопластика не проходит бесследно. В ходе трансфигурации тело мага изменилось до неузнаваемости. Он восстал из ада и обрушил ярость на наш мир, убивая даже тех, кто однажды называл его господином, и не оставляя камня на камне в тех землях, где его когда-то обожали. Теперь он живёт в уединении, упражняясь в демонологии, а те, кто называют себя его помощниками или учениками, вскоре лишаются своей маны и растворяются в легчайших порывах ветра.
""",
                complexity: .easy),
            
            HeroesListModel(
                heroNameImage: "magnusImage",
                heroName: "Magnus",
                heroPosition: .offlaneLine,
                heroStrength: 25,
                heroAgility: 9,
                heroIntelligence: 19,
                description: """
Лишь в одном было согласие между лучшими кузнецами вулкана Йорлак — в том, что рог магнорога есть драгоценнейший из всех материалов. Острейший и наибольший из них принадлежит зверю, которого они прозвали Magnus. Он с лёгкостью пронзал своим рогом ещё их отцов, пытавшихся заполучить сокровища его рода. Изо дня в день он возвращался в свою пещеру с побагровевшими от крови копытами и рогом — до тех пор, пока родоначальница не призвала его и весь его род уйти из пещер и искать покоя на севере, в тени горы. Магнорог лишь усмехнулся, ведь он всегда справлялся с защитой своего народа. Он решил, что племя останется, ведь магнороги не верят в случайности... и не меняют своих решений.

Однако когда внезапное извержение вулкана Йорлак обратило половину рода в пламя и пепел, защитник все же решился изменить свою волю. Выжившие шли на север, пока не встретили на своём пути заставу с сотней охотников, вооружённых луками и закалённой сталью. Меньшего магнорог и не ожидал. Он повёл своих самых свирепых братьев и сестёр в битву с яростью, сравнимой лишь с огнедышащей горой, подступающей сзади и неумолимо пожирающей их старейшин, матерей и телят. О дальнейшем ходе событий кузнецы спорят до сих пор.

Одни говорят, что магнорог воссоздал свой род, а другие — что он не пережил побоища, умерев от смертельных ранений у бездыханного тела родоначальницы. Но ни те, ни другие не правы. Магнорог поклялся, что вернётся в своё племя... но лишь когда последний из виновников извержения падёт от его могучего рога. Ведь магнороги не верят в случайности.
""",
                complexity: .hard),
            
            HeroesListModel(
                heroNameImage: "axeImage",
                heroName: "Axe",
                heroPosition: .offlaneLine,
                heroStrength: 25,
                heroAgility: 20,
                heroIntelligence: 18,
                description: """
Ещё будучи рядовым бугаем в армии Красного тумана, Могул-хан положил глаз на генеральский титул. Битву за битвой он самыми кровавыми способами доказывал собственное превосходство. Облегчало подъём в чинах и то, что без тени сомнения он мог обезглавить старшего по званию. В семилетней кампании на Тысячеболотье Могул-хан отличился в кровопролитных бойнях, и звезда его славы засияла еще ярче, но число соратников неизменно сокращалось. В ночь безоговорочной победы он провозгласил себя генералом Красного тумана, присвоив себе заодно и титул верховного военачальника. Однако теперь в его отряде не значилось ни одного воина. Множество бойцов было повержено врагом, но и от его топора погибло достаточно. Стоит ли говорить, что большинство солдат теперь ни за что не переманить под его знамена? Но Могул-хана это совсем не смущает, ведь он знает: один в поле воин.
""",
                complexity: .easy),
            
            HeroesListModel(
                heroNameImage: "oracleImage",
                heroName: "Oracle",
                heroPosition: .support,
                heroStrength: 20,
                heroAgility: 15,
                heroIntelligence: 26,
                description: """
Веками наследники Великого трона Симурри импортировали оракулов исключительно из Белого инкубатория, что в полых вершинах Гребня фанатиков. Вступительный взнос давался при зачатии эмбриона, а остальное, по доставке к Вратам высеченного короля зрелого, хорошо-тренированного пророка.

Бледные предсказательницы выводят всех разрешённых оракулов, рождая и воспитывая их, и своей физической формой оракулы закреплены в мире, общем для большинства из нас. Души же их бродят далеко, едва связанные легчайшими астральными пуповинами. Возвращаясь из своих вселенских странствий, пророки вещают огненные слова языками плоти. Симуррийские советники анализируют мистические речи пророков и находят в них видения будущего, дипломатические советы и прочие сверхъестественные надобности, дающие династии Высеченных королей победы при дворе и в бою. И так продолжалось поколениями, заполняя страницы Хроники высеченных королей именами королей-победителей и покорённых ими земель. Так продолжалось до тех пор пока один оракул, по имени Нериф, не прибыл для служения последнему из владык в каменных шлемах.

С самого начала пророчества Нерифа были необычны. Казалось, они не предсказывают будущее а вершат его. Странный предсказатель выкаркивал советы когда их никто не просил, и неожиданно симуррийцы оказывались ввязаны в конфликты с новыми врагами. Советники, ощущая угрозу своей власти, быстро осознали в последнем оракуле источник нежелательных свар. Они потребовали его устранения, запросив предсказательниц взять обратно неполноценного пророка и предоставив достойную замену. Но в зловещем сне Нериф описал гибель Инкубатория и через несколько часов пришли вести что страшный обвал погубил древнюю школу. Опасаясь разделить участь Бледных предсказательниц, советники удалились в свои палаты для совещаний, желая избежать внимания оракула.

Но Высеченный король всегда отличался практичностью. Он не полностью доверял своим сверхосторожным Советникам. Оракул такой редкости, думал он, должен быть использован для расширения владений. Исходя из этого, он сместил своих излишне робких советников и приблизил Нерифа. Плохо понимая свойства Нерифа, он попросту заявлял о своих желаниях и вынуждал Нерифа высказат
""",
                complexity: .medium),
            
            HeroesListModel(
                heroNameImage: "slarkImage",
                heroName: "Slark",
                heroPosition: .safeLine,
                heroStrength: 20,
                heroAgility: 21,
                heroIntelligence: 16,
                description: """
Мало кому из жителей суши известно о Темном рифе — подводной темнице для всяческого рода подводного отребья: змееногих-убийц, изменников из глубин, маньяков-мерансов и прочих морских обитателей, совершивших преступления против своих сородичей. Коридоры ее темны и запутанны, стены покрыты острыми как бритва кораллами. Лабиринт неустанно патрулируют юркие угри, а на страже незыблемо стоят гигантские анемоны. Выживают здесь лишь самые злобные и беспощадные. В этом скверном месте Slark провел большую часть жизни, заточенный за никому не известные прегрешения, не ведая любых радостей и не доверяя кому-либо. Выживать помогали скрытность и безжалостность, а также хранение планов и замыслов при себе. Однажды двенадцать заключенных, прозванных впоследствии Дюжиной Темного рифа, объединились для побега, которому было суждено окончиться плачевно. Заговорщики хранили свои планы в строжайшей тайне и расправлялись со всеми, кто мог бы сложить мозаику. Но все же хитрец Slark каким-то образом смог обо всем разузнать и подготовить себе место в затее. В день побега десятеро из Дюжины были убиты при попытке сбежать, а двоих изловили живьем и публично казнили на потеху остальным каторжникам. Однако никто не заметил, что беглецов было тринадцать. Воспользовавшись суматохой, Slark проскользнул незамеченным мимо охраны и тотчас же затерялся в глубинах. Своим новым местом обитания он выбрал опасные мангровые заросли у южной оконечности Тенистого взморья. Таким образом, Slark стал единственным в истории заключенным, которому удалось сбежать из Темного рифа.
""",
                complexity: .medium),
            
            HeroesListModel(
                heroNameImage: "spiritBreakerImage",
                heroName: "Spirit Breaker",
                heroPosition: .roaming,
                heroStrength: 28,
                heroAgility: 17,
                heroIntelligence: 14,
                description: """
Баратрум — гордое и могущественное существо, яростный первичный разум. В мир материи он пришёл, чтоб участвовать в событиях, отзвуки которых донесутся до его родной первичной вселенной. Сам собрал своё тело Баратрум, и послужит оно ему как в нашем мире, так и за его пределами. Его бренная оболочка черпает силы из нашей вселенной, объединяет она формы быка и обезьяны: рога, копыта и лапы воплощают его силу, скорость и ловкость. Кольцо в носу напоминает Баратруму, что служит он тайному господину и что мир, где трудится он, — лишь тень настоящего бытия.
""",
                complexity: .easy),
            
            HeroesListModel(
                heroNameImage: "timbersawImage",
                heroName: "Timbersaw",
                heroPosition: .offlaneLine,
                heroStrength: 27,
                heroAgility: 16,
                heroIntelligence: 23,
                description: """
Риззрак никак не мог забыть тех криков. Он работал не покладая рук и инструментов, он строил, дробил и ковал. Сон оставил его в угоду работе. Прошли месяцы с того момента, как он закрылся в мастерской своего дядюшки, и освобождение было близко как никогда. Почесав спину, Риззрак на мгновение закрыл глаза, и тут же перед ними предстали цветы, покачивающиеся на тихих волнах Бухты прорицаний, и всего мгновения оставались до того момента, как они обратятся облаком пыльцы, убивающей все живое. Риззрак встрепенулся и заработал с ещё большим рвением. Часами мастерскую наполнял ритмичный стук камней: то Риззрак натачивал лезвия своих огромных пил, а в его разуме была только одна картина — картина того, как соседи погибали в мёртвой хватке опутывавших здания лоз. Но потоп в Бухте прорицаний был ничем в сравнении с тем, что пустило корни в стены города.

Риззрак думал, что пил-костюм сделает его сильнее, и это был последний рубеж перед поглощавшим разум страхом. Ветви, щепки и кровь. Когда город пал, Риззрак бежал от деревьев. Деревья умели ходить. Деревья умели сражаться. Деревья умели убивать. Деревья завалили ворота и заполонили город. Деревья разрушали последние укрепления Бухты прорицаний и преследовали выживших. В абсолютной тишине мастерской раздавался грохот: то Риззрак проверял каждое звено цепи и клешню на её конце. Пил-костюм был готов.

Дрожащими руками Риззрак запустил обвешанный лезвиями механизм. Кузнеца обуял страх — страх перед тем, что его ждало и с чем ему предстоит сразиться, чтобы вернуть разуму покой. Хоть пил-костюм и вытряхивал весь дух из оператора, тот знал, что ему нужно взглянуть в глаза своему страху, каким бы тот ни был, и что пора положить ему конец.
""",
                complexity: .medium),
            
            HeroesListModel(
                heroNameImage: "voidImage",
                heroName: "Faceless void",
                heroPosition: .safeLine,
                heroStrength: 20,
                heroAgility: 19,
                heroIntelligence: 15,
                description: """
Дарктеррор явился из Класзурема, мира вне времени. Остаётся загадкой, почему битва за Осколки привлекла существо из иного измерения в наш физический мир. Вероятно, разлад в гармонии нашей вселенной ощутим и в соседних измерениях. Для Дарктеррора время ничтожно. Это лишь инструмент, что помогает союзникам и обременяет противников. Способность видеть прошлое и будущее бытия сделала гостя из иного мира отстранённым, даже безразличным, однако в бой он стремится с необычайным рвением.
""",
                complexity: .veryHard),
        ]
    }
    
}
