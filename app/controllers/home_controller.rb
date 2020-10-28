class HomeController < ApplicationController

  def index

    @npcs = []

    5.times do
      @npcs << generate_npc
    end

  end

  def generate_npc
    @npc_motivations = npc_motivations
    @npc_motivation_nouns = npc_motivation_nouns

    @motivations_array = @npc_motivations.zip(@npc_motivation_nouns)
    @motivations = []
    @motivations_array.each do |motivation|
      @motivations << motivation.join(" ")
    end
    return {
      body: "A(n) #{npc_modifier} #{npc_noun}, #{power_level(params[:randomness].to_i)} the party, who #{@motivations.join(", ")}.",
      mannerisms: "Mannerisms: #{npc_mannerisms.join(", ")}"
    }
  end

  def npc_modifier
    ["superfluous","inept","pleasant","lethargic","jovial","addicted","banal","insensitive","defiant","shrewd","conformist","logical","titled","obnoxious","liberal","nefarious","subtle","inexperienced","insightful","compliant","sensible","reputable","prying","tactless","destitute","untrained","wicked","oblivious","fanatic","conniving","romantic","lazy","refined","plebeian","careful","unreasonable","pessimistic","indispensable","childish","alluring","skilled","solemn","scholarly","pious","defective","neglectful","habitual","conservative","uneducated","optimistic","lively","meek","uncouth","inconsiderate","affluent","forthright","helpful","willful","cultured","despondent","idealistic","unconcerned","indifferent","revolting","mindless","unsupportive","generous","fickle","curious","passionate","rational","docile","elderly","touchy","devoted","coarse","cheery","sinful","needy","established","foolish","pragmatic","naive","dignified","unseemly","cunning","serene","privileged","pushy","dependable","delightful","thoughtful","glum","kind","righteous","miserly","hopeless","likable","corrupt","confident"].sample
  end

  def npc_noun
    ["gypsy","missionary","villager","mediator","performer","witch","outcast","magus","crook","magister","merchant","mercenary","conscript","civilian","serf","expert","caretaker","worker","activist","brute","commoner","hermit","actor","hero","inquisitor","judge","orator","herald","champion","lord","ranger","chieftain","highwayman","cleric","villain","occultist","pioneer","fortune-hunter","slave","professor","reverend","burglar","governor","gunman","servant","thug","vicar","scrapper","clairvoyant","charmer","drifter","officer","monk","patriarch","globetrotter","journeyman","explorer","homemaker","shopkeeper","sniper","statesman","warden","recluse","crone","courtier","astrologer","outlaw","steward","adventurer","priest","duelist","adept","polymath","soldier","tradesman","jack-of-all-trades","bum","magician","entertainer","hitman","aristocrat","sorcerer","traveler","craftsman","wizard","preacher","laborer","vagrant","scientist","beggar","artisan","master","apprentice","ascetic","tradesman","rogue","ascendant","politician","superior","warrior"].sample
  end

  def npc_motivations
    ["advises","shepherds","takes","works","manages","obtains","abuses","discovers","accompanies","suppresses","attempts","indulges","deters","offends","proclaims","spoils","chronicles","acquires","guides","operates","oppresses","fulfills","damages","learns","accesses","interacts","drives","publicizes","persecutes","refines","creates","reviews","burdens","communicates","composes","abducts","aids","advocates","processes","undermines","promotes","follows","implements","reports","explains","conceives","advances","understands","develops","discourages","blights","guards","collaborates","steals","attends","progresses","conquers","strives","suggests","detects","distresses","hinders","completes","weakens","executes","possesses","plunders","compels","achieves","maintains","records","constructs","joins","secures","realizes","embraces","encourages","assists","informs","conveys","contacts","agonizes","defiles","patronizes","robs","pursues","comprehends","produces","depresses","establishs","associates","administers","institutes","determines","overthrows","prepares","relates","accounts","seeks","supports"].sample(3)
  end

  def npc_motivation_nouns
    columns = [
      [
        "wealth",
        "hardship",
        "affluence",
        "resources",
        "prosperity",
        "poverty",
        "opulence",
        "deprivation",
        "success",
        "distress",
        "contraband",
        "music",
        "literature",
        "technology",
        "alcohol",
        "medicines",
        "beauty",
        "strength",
        "intelligence",
        "force"
      ],
      [
        "the wealthy",
        "the populous",
        "enemies",
        "the public",
        "religion",
        "the poor",
        "family",
        "the elite",
        "academia",
        "the forsaken",
        "the law",
        "the government",
        "the oppressed",
        "friends",
        "criminals",
        "allies",
        "secret societies",
        "the world",
        "military",
        "the church"
      ],
      [
       "dreams",
       "discretion",
       "love",
       "freedom",
       "pain",
       "faith",
       "slavery",
       "enlightenment",
       "racism",
       "sensuality",
       "dissonance",
       "peace",
       "discrimination",
       "disbelief",
       "pleasure",
       "hate",
       "happiness",
       "servitude",
       "harmony",
       "justice"
     ],
     [
       "gluttony",
       "lust",
       "envy",
       "greed",
       "laziness",
       "wrath",
       "pride",
       "purity",
       "moderation",
       "vigilance",
       "zeal",
       "composure",
       "charity",
       "modesty",
       "atrocities",
       "cowardice",
       "narcissism",
       "compassion",
       "valor",
       "patience"
     ],
     [
       "advice",
       "propaganda",
       "science",
       "knowledge",
       "communications",
       "lies",
       "myths",
       "riddles",
       "stories",
       "legends",
       "industry",
       "new religions",
       "progress",
       "animals",
       "ghosts",
       "magic",
       "nature",
       "old religions",
       "expertise",
       "spirits"
      ]
    ]
    motivation_nouns = []
    (0..4).to_a.shuffle.take(3).each do |i|
      motivation_nouns << columns[i].sample
    end
    return motivation_nouns
  end

  def power_level(randomness)

    roll = rand(1..100)

    if randomness == 1
      if roll.between?(1,2)
        return "much weaker than"
      elsif roll.between?(3,10)
        return "slightly weaker than"
      elsif roll.between?(11,90)
        return "comparable to"
      elsif roll.between?(91,98)
        return "slightly stronger than"
      elsif roll.between?(99,100)
        return "much stronger than"
      end
    end

    if randomness == 2
      if roll.between?(1,4)
        return "much weaker than"
      elsif roll.between?(5,15)
        return "slightly weaker than"
      elsif roll.between?(16,85)
        return "comparable to"
      elsif roll.between?(86,96)
        return "slightly stronger than"
      elsif roll.between?(97,100)
        return "much stronger than"
      end
    end

    if randomness == 3
      if roll.between?(1,5)
        return "much weaker than"
      elsif roll.between?(6,20)
        return "slightly weaker than"
      elsif roll.between?(21,80)
        return "comparable to"
      elsif roll.between?(81,95)
        return "slightly stronger than"
      elsif roll.between?(96,100)
        return "much stronger than"
      end
    end

    if randomness == 4
      if roll.between?(1,8)
        return "much weaker than"
      elsif roll.between?(9,25)
        return "slightly weaker than"
      elsif roll.between?(26,75)
        return "comparable to"
      elsif roll.between?(76,92)
        return "slightly stronger than"
      elsif roll.between?(93,100)
        return "much stronger than"
      end
    end

    if randomness == 5
      if roll.between?(1,12)
        return "much weaker than"
      elsif roll.between?(13,30)
        return "slightly weaker than"
      elsif roll.between?(31,70)
        return "comparable to"
      elsif roll.between?(71,88)
        return "slightly stronger than"
      elsif roll.between?(89,100)
        return "much stronger than"
      end
    end

  end

  def npc_mannerisms
    [
      "Prone to singing, whistling, or humming quietly",
      "Slurs words, lisps, or stutters",
      "Enunciates overly clearly",
      "Speaks loudly",
      "Whispers",
      "Uses flowery speech or long words",
      "Frequently uses the wrong word",
      "Uses colorful oaths and exclamations",
      "Makes constant jokes or puns",
      "Fidgets",
      "Squints",
      "Stares into the distance",
      "Chews something",
      "Paces",
      "Taps fingers",
      "Bites fingernails",
      "Twirls hair or tugs bear",
      "Uses a falling inflection",
      "Ends sentences with question marks",
      "Speaks in a whisper",
      "Always talks over others",
      "Tendency to mumble",
      "Slurs words, even when sober",
      "Has a sing-song speech pattern",
      "Unnecessary or exaggerated throat clearing",
      "Deep breaths between every sentence",
      "Constantly swallowing when nervous",
      "Tilting head in thought",
      "Hair tossing",
      "Hair playing or twirling when flirting",
      "Head bobbing while listening to music",
      "Grinding teeth",
      "Scratching the head",
      "Rubbing neck",
      "Raised eyebrows",
      "Head on the chin in resting position",
      "Jaw clenching in moments of tension",
      "Jutted chin",
      "Nose twitching or wrinkling",
      "Smacking lips in satisfaction",
      "Licking the lips when nervous",
      "Sticking out the tongue while thinking",
      "Biting the bottom lip",
      "Pulling at the bottom lip",
      "Biting the inside of the cheek",
      "Movement of the mouth: quivering, curling, pursed, twitching, tensed",
      "Sideways glance",
      "Likes to wink",
      "Fluttering eyelids",
      "Tendency to look down one’s nose",
      "Eyes that dart everywhere",
      "Tendency to avoid eye contact",
      "Prolonged eye contact in conversation",
      "Looking down at feet while walking",
      "Rapid blinking when lying",
      "Frequently gazes off into space",
      "Furrowed or knitted brows",
      "Movement of the eyes: rolling, squinting, twitching",
      "Description of the eyes: wide, glassy, crossed, dilated, narrowed",
      "Movement of the index finger: pointing, jabbing downwards, stabbing in the air",
      "Snapping fingers",
      "Arms crossed over chest",
      "Pinching the bridge of the nose",
      "Rubbing the temple",
      "Steepled hands",
      "Biting fingernails",
      "Wiping clammy hands",
      "Tightly clenched hands",
      "Running a hand through the hair",
      "Rubbing the eyes",
      "Touching the nose",
      "Stroking chin in thought",
      "Tugging at ear",
      "Tracing scars without thinking",
      "Rubbing the tips of fingers together",
      "Braiding hair automatically",
      "Passing a hand over the face when tired",
      "Flexing fingers",
      "Cracking knuckles",
      "Drumming fingers on a surface",
      "Wild gesturing while talking",
      "Twiddling thumbs",
      "Swinging arms back and forth when walking",
      "Shrugging shoulders",
      "Dropping shoulders",
      "Swaying while standing",
      "Slouching, slumping posture",
      "Tight, drawn-in shoulders when sitting",
      "Crossing legs when sitting",
      "Foot tapping",
      "Legs will uncontrollably shake",
      "Knees knocking against each other",
      "Rocking back and forth on heels",
      "Shifting weight from one foot to the other",
      "Taking glasses off and cleaning them",
      "Peering over glasses",
      "Adjusting or pushing up glasses",
      "Putting earpiece of glasses in mouth",
      "Has a cigarette perpetually dangling out of mouth",
      "Buttoning and unbuttoning coat with no purpose",
      "Always sitting on the very edge of chair",
      "Hands habitually on coat lapels",
      "Chewing the tip of a pen or pencil",
      "Jingling money in pockets",
      "Playing with the marker",
      "Tugging at pants before sitting",
      "Tearing at a napkin at the table",
      "Checking watch repeatedly",
      "Using a toothpick at all times",
      "Touching up makeup constantly",
      "Repeatedly checking cell phone",
      "Twirling a pencil at a desk",
      "Clicking a ballpoint pen open and close",
      "Playing with a Rubix Cube when bored",
      "Fiddling with earrings",
      "Shredding paper without thinking",
      "Peeling labels from bottles",
      "Bending paperclips in half",
      "Twisting the rings on fingers",
      "Tipping chair back",
      "Leaning against the wall while talking",
      "Tugging at collar of shirt when nervous",
      "Smacking gum"
    ].sample(3)
  end

end
