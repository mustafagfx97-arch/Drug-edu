import 'package:flutter/material.dart';

class VisualGuideMediaLink {
  const VisualGuideMediaLink({
    required this.label,
    required this.url,
    this.isVideo = false,
  });

  final String label;
  final String url;
  final bool isVideo;
}

class VisualGuideData {
  const VisualGuideData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.steps,
    required this.mistakes,
    required this.patientSummaryAr,
    this.firstUseSteps = const [],
    this.afterUseSteps = const [],
    this.cleaningSteps = const [],
    this.teachBackAr = '',
    this.scopeNote = '',
    this.sourceLabel = '',
    this.mediaLinks = const [],
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> steps;
  final List<String> mistakes;
  final String patientSummaryAr;
  final List<String> firstUseSteps;
  final List<String> afterUseSteps;
  final List<String> cleaningSteps;
  final String teachBackAr;
  final String scopeNote;
  final String sourceLabel;
  final List<VisualGuideMediaLink> mediaLinks;
}

const visualGuideCatalog = <VisualGuideData>[
  VisualGuideData(
    id: 'mdi',
    title: 'Metered-dose inhaler (pMDI)',
    subtitle: 'Slow coordinated inhalation; priming, shaking and cleaning remain product-specific.',
    icon: Icons.air_outlined,
    steps: [
      'Remove the cap, inspect the mouthpiece and prepare the inhaler exactly as its label requires.',
      'Sit or stand upright and breathe out fully away from the mouthpiece.',
      'Seal your lips around the mouthpiece and start a slow, deep breath through the mouth.',
      'Press the canister once as inhalation begins, then continue the slow deep breath for about 3–5 seconds when possible.',
      'Remove the inhaler and hold your breath for up to 10 seconds, then breathe out slowly.',
    ],
    afterUseSteps: [
      'If another puff is prescribed, follow the product-specific wait/shake instructions before the next puff.',
      'After an inhaled corticosteroid, rinse the mouth with water and spit it out.',
      'Replace the cap and check the dose counter if the inhaler has one.',
    ],
    cleaningSteps: [
      'Clean the actuator/mouthpiece only as the exact product instructions describe; different pMDIs are not cleaned the same way.',
    ],
    mistakes: [
      'Inhaling too fast.',
      'Pressing the canister well before or after inhalation begins.',
      'Skipping product-specific priming or shaking.',
      'Continuing to use an inhaler after its labeled actuation count is exhausted.',
    ],
    patientSummaryAr:
        'أخرج الهواء أولًا، ثم ابدأ شهيقًا بطيئًا وعميقًا واضغط بخة واحدة مع بداية الشهيق واستمر بالشهيق. احبس النفس حتى 10 ثوانٍ إن استطعت. التحضير والرج والتنظيف يختلف حسب المنتج فلا تنسخ تعليمات بخاخ آخر.',
    teachBackAr:
        'أرني كيف ستنسق بين بداية الشهيق والضغط على البخاخ، ثم أخبرني متى تتمضمض بعد الجرعة.',
    scopeNote:
        'Core pMDI breathing technique only. Exact priming, shaking, cleaning and spacer compatibility must come from the exact inhaler label.',
    sourceLabel:
        'CDC Asthma inhaler education · reviewed Aug 28, 2026; American Lung Association MDI technique · Jan 2026',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'CDC inhaler videos',
        url: 'https://www.cdc.gov/asthma/caring/',
        isVideo: true,
      ),
      VisualGuideMediaLink(
        label: 'American Lung Association MDI video',
        url: 'https://www.lung.org/lung-health-diseases/lung-disease-lookup/asthma/treatment/devices/metered-dose-inhaler',
        isVideo: true,
      ),
    ],
  ),
  VisualGuideData(
    id: 'spacer',
    title: 'pMDI + valved holding chamber (spacer)',
    subtitle: 'One puff at a time with slow inhalation; chamber and mask cleaning are device-specific.',
    icon: Icons.device_hub_outlined,
    steps: [
      'Remove caps, check the inhaler and chamber, and attach a compatible pMDI firmly to the chamber.',
      'Prepare or shake the inhaler according to its own label, then breathe out fully away from the chamber.',
      'Seal lips around the chamber mouthpiece. If a mask is used, make a tight seal over the nose and mouth.',
      'Press the inhaler once only, then inhale slowly and deeply through the chamber. If the chamber whistles, slow the breath down.',
      'Hold the breath for up to 10 seconds when possible. With a mask, keep a good seal for the breathing sequence taught for that chamber.',
    ],
    afterUseSteps: [
      'Give only one puff into the chamber at a time; repeat the full sequence for another prescribed puff.',
      'After an inhaled corticosteroid, rinse the mouth and spit. After a steroid delivered through a mask, wipe the face as well.',
    ],
    cleaningSteps: [
      'Clean and dry the chamber exactly as its manufacturer instructs; washing method, drying and antistatic handling differ by chamber.',
    ],
    mistakes: [
      'Spraying several puffs into the chamber at once.',
      'Delaying inhalation after actuating the puff.',
      'Breathing in so fast that a whistle sounds.',
      'Using an incompatible chamber or a mask that does not seal.',
    ],
    patientSummaryAr:
        'ركّب البخاخ على السبيسر وأعطِ بخة واحدة فقط داخل الحجرة ثم استنشق ببطء وعمق. إذا أصدر السبيسر صفيرًا فأنت تسحب الهواء بسرعة أكثر من اللازم. لا تضع عدة بخات معًا.',
    teachBackAr:
        'أرني كيف تركّب البخاخ، أعطني بخة واحدة داخل الحجرة، ثم أرني سرعة الشهيق. ماذا يعني صوت الصفير؟',
    scopeNote:
        'Use a chamber compatible with the exact inhaler. Mask breathing pattern and cleaning instructions vary by chamber.',
    sourceLabel:
        'CDC Asthma spacer education · reviewed Aug 28, 2026; American Lung Association spacer technique · Feb 2026',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'CDC MDI + spacer video',
        url: 'https://www.cdc.gov/asthma/caring/',
        isVideo: true,
      ),
      VisualGuideMediaLink(
        label: 'American Lung Association spacer video',
        url: 'https://www.lung.org/lung-health-diseases/lung-disease-lookup/asthma/treatment/devices/metered-dose-inhaler-chamber-spacer',
        isVideo: true,
      ),
    ],
  ),
  VisualGuideData(
    id: 'nasal-spray',
    title: 'Nasal spray',
    subtitle: 'Prime the exact product, aim away from the septum and use only a gentle sniff.',
    icon: Icons.water_drop_outlined,
    firstUseSteps: [
      'Check the exact product leaflet for first-use priming and re-priming after nonuse; the number of pumps is not universal.',
    ],
    steps: [
      'Shake or prepare the bottle only if the exact product instructs you to do so.',
      'Blow the nose gently if needed.',
      'Keep the head neutral or slightly forward. Close one nostril and place only the tip into the other nostril.',
      'Aim the nozzle slightly outward, away from the nasal septum in the center of the nose.',
      'While sniffing gently, press the spray. Breathe out through the mouth and repeat on the other side if prescribed.',
    ],
    afterUseSteps: [
      'Wipe the nozzle and replace the cap according to the product directions.',
      'Avoid forceful sniffing that pulls the medicine straight into the throat.',
    ],
    cleaningSteps: [
      'Follow the exact nozzle-cleaning instructions. Do not enlarge a blocked spray hole with a pin unless the product specifically instructs it.',
    ],
    mistakes: [
      'Aiming directly at the septum.',
      'Sniffing forcefully.',
      'Using the same priming count for every brand.',
      'Sharing the nasal spray bottle.',
    ],
    patientSummaryAr:
        'نظف الأنف بلطف، أدخل طرف البخاخ قليلًا ووجّهه إلى الخارج بعيدًا عن الحاجز الأوسط، ثم رش مع شهيق خفيف فقط. عدد بخات الـpriming يختلف من منتج لآخر.',
    teachBackAr:
        'أشر لي أين الحاجز الأوسط، ثم أرني إلى أي جهة ستوجه الفوهة وكيف سيكون الشهيق.',
    scopeNote:
        'Positioning is general; priming, shaking, cleaning and re-priming intervals must be checked on the exact nasal spray.',
    sourceLabel:
        'DailyMed · Fluticasone propionate nasal spray · updated 2026; intranasal product labeling',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'DailyMed fluticasone visual instructions',
        url: 'https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=0107ad1c-1d8e-434c-a91f-dd2caf4fa5e5',
      ),
    ],
  ),
  VisualGuideData(
    id: 'eye-drops',
    title: 'Eye drops',
    subtitle: 'One drop into the lower conjunctival pocket with contamination prevention and product-specific spacing.',
    icon: Icons.remove_red_eye_outlined,
    steps: [
      'Wash and dry hands. Remove contact lenses first when the exact product requires it.',
      'Tilt the head back and gently pull down the lower eyelid to make a pocket.',
      'Hold the bottle above the eye without touching the eye, lashes, eyelid or skin with the tip.',
      'Instill one prescribed drop into the lower pocket; extra drops usually run out rather than adding benefit.',
      'Close the eye gently after the drop. Use punctal/nasolacrimal pressure when taught or when clinically appropriate for the product.',
    ],
    afterUseSteps: [
      'If using more than one ophthalmic medicine, follow the spacing rule for the exact products; XALATAN labeling specifies at least 5 minutes between topical eye medicines.',
      'For XALATAN, remove contact lenses before dosing and wait at least 15 minutes before reinserting them.',
      'Replace the cap without touching or wiping the dropper tip against surfaces.',
    ],
    mistakes: [
      'Touching the dropper tip to the eye or lashes.',
      'Squeezing several drops because the first drop felt small.',
      'Putting multiple eye medicines one immediately after another.',
      'Reinserting contact lenses too soon for a product that contains a preservative such as benzalkonium chloride.',
    ],
    patientSummaryAr:
        'اغسل يديك، اسحب الجفن السفلي وضع قطرة واحدة في الجيب من دون أن تلمس الفوهة العين أو الرموش. أغلق العين بلطف. إذا لديك أكثر من قطرة أو عدسات فالتزم بالفاصل الخاص بالمنتج.',
    teachBackAr:
        'أرني أين ستضع القطرة وكيف تمنع الفوهة من لمس العين، ثم أخبرني ماذا تفعل إذا كان لديك نوعان من القطرات.',
    scopeNote:
        'Core drop-placement technique is general. Contact-lens removal, inter-drop spacing, punctal occlusion and shaking differ by product.',
    sourceLabel:
        'DailyMed · XALATAN latanoprost ophthalmic solution current labeling',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'DailyMed XALATAN instructions',
        url: 'https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=a98595b3-9f47-48e0-b18d-550a2095f264',
      ),
    ],
  ),
  VisualGuideData(
    id: 'insulin-pen',
    title: 'Insulin pen',
    subtitle: 'Device framework; exact priming and hold time remain product-specific.',
    icon: Icons.colorize_outlined,
    steps: [
      'Confirm the correct insulin and pen.',
      'Attach a new compatible needle.',
      'Perform the product-specific safety test or priming step.',
      'Dial the prescribed dose.',
      'Inject using the pen technique and hold time specified for that device.',
    ],
    mistakes: [
      'Skipping the pen-specific priming step.',
      'Reusing needles routinely.',
      'Removing the needle too quickly before the full dose is delivered.',
    ],
    patientSummaryAr:
        'تأكد من نوع الإنسولين والقلم، استخدم إبرة جديدة، ونفّذ اختبار القلم أو التهيئة الخاصة بهذا المنتج ثم اضبط الجرعة الموصوفة. مدة بقاء الإبرة تحت الجلد قد تختلف حسب القلم لذلك اتبع تعليمات جهازك.',
  ),

  VisualGuideData(
    id: 'dpi',
    title: 'Dry-powder inhaler (DPI)',
    subtitle: 'Core DPI technique; loading differs by device.',
    icon: Icons.air_rounded,
    steps: [
      'Prepare or load the dose according to the exact device.',
      'Breathe out fully away from the mouthpiece.',
      'Seal lips around the mouthpiece.',
      'Inhale quickly and deeply through the device.',
      'Hold the breath comfortably, then breathe out away from the device.',
    ],
    mistakes: [
      'Breathing out into the device and exposing the powder to moisture.',
      'Using a slow MDI-style inhalation instead of a forceful DPI inhalation.',
      'Assuming every DPI is loaded the same way.',
    ],
    patientSummaryAr:
        'حضّر الجرعة حسب جهازك، أخرج الهواء بعيدًا عن الجهاز، ثم استنشق بقوة وعمق من الفوهة. لا تزفر داخل الجهاز لأن الرطوبة قد تؤثر على البودرة.',
  ),
  VisualGuideData(
    id: 'symbicort-pmdi',
    title: 'SYMBICORT pressurized MDI',
    subtitle: 'Exact aerosol technique: shake, slow coordinated inhalation, repeat correctly, then rinse.',
    icon: Icons.medication_liquid_outlined,
    firstUseSteps: [
      'Before first use, shake well for 5 seconds and release 2 test sprays into the air away from the face, shaking for 5 seconds before each spray.',
      'Re-prime with 2 test sprays if the inhaler has not been used for more than 7 days or if it has been dropped.',
    ],
    steps: [
      'Shake well for 5 seconds, remove the mouthpiece cover and check the mouthpiece.',
      'Breathe out fully. Hold the inhaler upright and seal lips around the mouthpiece.',
      'Begin a slow deep breath through the mouth and press the top fully once to release the medicine.',
      'Continue breathing in and hold the breath for about 10 seconds or as long as comfortable.',
      'For the second prescribed puff, shake again for 5 seconds and repeat the inhalation sequence.',
    ],
    afterUseSteps: [
      'Close the mouthpiece cover.',
      'After the prescribed dose, rinse the mouth with water and spit it out; do not swallow the rinse water.',
      'Use the dose counter to plan the refill rather than estimating by canister feel.',
    ],
    mistakes: [
      'Using Turbohaler loading steps on the pMDI version.',
      'Skipping the 5-second shake.',
      'Inhaling rapidly instead of slowly while actuating.',
      'Forgetting to re-prime after more than 7 days without use or after the inhaler is dropped.',
    ],
    patientSummaryAr:
        'إذا كان جهازك SYMBICORT البخاخ المضغوط: رجّه 5 ثوانٍ، أخرج النفس، ثم خذ شهيقًا بطيئًا وعميقًا واضغط بخة واحدة مع بداية الشهيق. إذا كانت الجرعة بختين رجّه مرة أخرى قبل البخة الثانية، وبعد الانتهاء تمضمض وابصق الماء.',
    teachBackAr:
        'أرني الفرق بين تحضير أول استخدام وبين الجرعة اليومية، ثم أرني كيف ستأخذ البخة الثانية.',
    scopeNote:
        'Use this guide only for the pressurized SYMBICORT aerosol/MDI. SYMBICORT Turbohaler uses a different first-use and dose-loading technique.',
    sourceLabel:
        'DailyMed · SYMBICORT budesonide/formoterol aerosol · current IFU; AstraZeneca official technique video',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'Official SYMBICORT technique video',
        url: 'https://www.symbicorttouchpoints.com/professional-resources/how-to-use-symbicort-inhaler',
        isVideo: true,
      ),
      VisualGuideMediaLink(
        label: 'DailyMed SYMBICORT IFU',
        url: 'https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=fafa4cf1-99c2-43d5-73ad-51f256de3be0',
      ),
    ],
  ),
  VisualGuideData(
    id: 'turbuhaler',
    title: 'SYMBICORT Turbohaler',
    subtitle: 'Upright twist-load device; first-use preparation is not the same as daily dose loading.',
    icon: Icons.rotate_right_outlined,
    firstUseSteps: [
      'Unscrew and remove the cover, then hold the Turbohaler upright with the colored grip at the bottom.',
      'Turn the grip fully in one direction and fully back in the other direction until a click is heard.',
      'Repeat that full back-and-forth preparation once more. The new Turbohaler is then prepared for use.',
    ],
    steps: [
      'Remove the cover and keep the Turbohaler upright with the grip at the bottom.',
      'Without holding the mouthpiece, turn the grip fully one way and fully back until it clicks to load one dose.',
      'Breathe out gently and fully away from the mouthpiece; never breathe out through the Turbohaler.',
      'Seal lips around the mouthpiece and breathe in as deeply and forcefully as you can through the mouth.',
      'Remove the device before breathing out. If another inhalation is prescribed, load the next dose and repeat.',
    ],
    afterUseSteps: [
      'Replace the cover tightly.',
      'Rinse the mouth with water after the maintenance dose and spit it out.',
      'Do not take another dose just because you did not taste or feel the powder.',
    ],
    mistakes: [
      'Repeating the two-cycle first-use preparation every day.',
      'Holding the device sideways while loading.',
      'Exhaling into the mouthpiece.',
      'Taking an extra inhalation because the powder was not tasted or felt.',
    ],
    patientSummaryAr:
        'إذا كان جهازك SYMBICORT Turbohaler: أول جهاز جديد يحتاج دورة اللف ذهابًا وإيابًا مرتين للتحضير. بعد ذلك كل جرعة تحتاج دورة واحدة فقط حتى تسمع click، ثم أخرج النفس بعيدًا عن الجهاز واستنشق بقوة وعمق.',
    teachBackAr:
        'أرني ماذا تفعل أول مرة مع جهاز جديد، ثم أرني كم دورة لف تحتاج عند الجرعة اليومية العادية.',
    scopeNote:
        'This is for SYMBICORT Turbohaler. Other twist-loaded DPIs can look similar but may have different priming, dose counters or strengths.',
    sourceLabel:
        'AstraZeneca UK · SYMBICORT Turbohaler patient leaflet · updated Sep 2025',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'Official patient leaflet',
        url: 'https://www.medicines.org.uk/emc/product/1326/pil',
      ),
    ],
  ),
  VisualGuideData(
    id: 'diskus',
    title: 'Diskus / Accuhaler',
    subtitle: 'Open → click lever once → exhale away → quick deep inhalation → close.',
    icon: Icons.horizontal_rule_rounded,
    steps: [
      'Open the DISKUS until the mouthpiece is fully exposed.',
      'Keep it level and flat. Slide the lever once until it clicks; the dose counter decreases by 1.',
      'Breathe out as fully as possible while holding the device level and away from the mouth. Never exhale into the mouthpiece.',
      'Seal lips around the mouthpiece and breathe in quickly and deeply through the device.',
      'Remove the DISKUS, hold the breath for about 10 seconds or as long as comfortable, then breathe out slowly and close it.',
    ],
    afterUseSteps: [
      'For an inhaled corticosteroid-containing Diskus, rinse the mouth with water and spit it out.',
      'Use the dose counter to identify when only a few doses remain.',
    ],
    cleaningSteps: [
      'Keep the DISKUS dry. Do not wash it or take it apart.',
    ],
    mistakes: [
      'Tilting the device after loading the dose.',
      'Moving the lever more than once before inhaling and wasting doses.',
      'Exhaling into the device.',
      'Using a spacer with a DISKUS.',
      'Taking an extra dose because no powder was tasted or felt.',
    ],
    patientSummaryAr:
        'افتح الـDiskus، أبقه أفقيًا، حرّك الرافعة مرة واحدة حتى تسمع click، ثم أخرج النفس بعيدًا عنه واستنشق بسرعة وعمق. لا تنفخ داخل الجهاز، لا تستخدم spacer معه، ولا تأخذ جرعة إضافية لأنك لم تشعر بطعم البودرة.',
    teachBackAr:
        'أرني كيف تحافظ على الجهاز أفقيًا، ومتى تحرك الرافعة، وأين ستخرج النفس قبل الجرعة.',
    scopeNote:
        'Diskus/Accuhaler is a dry-powder device and does not use pMDI or spacer technique.',
    sourceLabel:
        'DailyMed · ADVAIR DISKUS / fluticasone-salmeterol DISKUS current IFU',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'Official ADVAIR site / patient IFU',
        url: 'https://www.advair.com/',
      ),
      VisualGuideMediaLink(
        label: 'DailyMed ADVAIR DISKUS IFU',
        url: 'https://www.dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=17dd0a86-8161-4aa9-9b90-a23d81b38164&type=display',
      ),
    ],
  ),
  VisualGuideData(
    id: 'ellipta',
    title: 'ELLIPTA',
    subtitle: 'Opening the cover loads a dose; inhale long, steady and deep without blocking the air vent.',
    icon: Icons.view_sidebar_outlined,
    steps: [
      'Wait until you are ready to inhale, then slide the cover fully down until it clicks. Opening the cover loads one dose and the counter moves down by 1.',
      'Hold the inhaler away from the mouth and breathe out fully; never breathe out into the mouthpiece.',
      'Seal lips around the curved mouthpiece without blocking the air vent with fingers or lips.',
      'Take one long, steady, deep breath in through the mouth.',
      'Remove the inhaler and hold the breath for about 3–4 seconds or as long as comfortable, then breathe out slowly and close the cover.',
    ],
    afterUseSteps: [
      'Do not repeat the dose simply because you did not taste or feel the medicine.',
      'For an inhaled corticosteroid-containing ELLIPTA product, rinse the mouth and spit after the dose.',
    ],
    cleaningSteps: [
      'Routine cleaning is not required for many ELLIPTA products; if needed, wipe the mouthpiece with a dry tissue before closing the cover.',
    ],
    mistakes: [
      'Opening and closing the cover without inhaling, which prepares and can waste a dose.',
      'Blocking the air vent.',
      'Exhaling into the mouthpiece.',
      'Shaking the inhaler as if it were a pMDI.',
    ],
    patientSummaryAr:
        'افتح غطاء ELLIPTA فقط عندما تكون جاهزًا لأن فتحه يجهز جرعة. أخرج النفس بعيدًا عن الجهاز، لا تسد فتحة الهواء، ثم خذ شهيقًا طويلًا وثابتًا وعميقًا. لا تأخذ جرعة إضافية إذا لم تشعر بطعم الدواء.',
    teachBackAr:
        'ماذا يحدث للجرعة عندما تفتح الغطاء؟ أرني أين توجد فتحة الهواء وكيف ستمنع إغلاقها بأصابعك.',
    scopeNote:
        'The ELLIPTA loading mechanism is shared across several products, but dose frequency and discard date must come from the exact medicine label.',
    sourceLabel:
        'DailyMed · ELLIPTA device IFU · current umeclidinium/umeclidinium-vilanterol labeling',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'DailyMed ELLIPTA visual IFU',
        url: 'https://www.dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=6de414b1-f707-4b98-9e4b-742032ec90af&type=display',
      ),
    ],
  ),
  VisualGuideData(
    id: 'respimat',
    title: 'SPIRIVA RESPIMAT',
    subtitle: 'First-use cartridge preparation plus daily T-O-P: Turn, Open, Press.',
    icon: Icons.blur_on_outlined,
    firstUseSteps: [
      'With the cap closed, remove the clear base, insert the narrow end of the cartridge and push the inhaler down on a firm surface until the cartridge clicks into place.',
      'Replace the clear base until it clicks and write the discard-by date: 3 months from cartridge insertion for current SPIRIVA RESPIMAT labeling.',
      'With cap closed, Turn the clear base half a turn until it clicks; Open the cap fully; point toward the ground and Press the dose-release button.',
      'Repeat Turn–Open–Press until a mist is visible, then repeat the sequence 3 more times. The inhaler is then primed for daily use.',
    ],
    steps: [
      'TURN: keep the cap closed and turn the clear base half a turn until it clicks.',
      'OPEN: open the cap until it snaps fully open.',
      'Breathe out slowly and fully away from the inhaler.',
      'PRESS: seal lips around the mouthpiece without covering the air vents. Begin a slow deep breath, press the dose-release button and continue inhaling.',
      'Hold the breath for about 10 seconds or as long as comfortable. For SPIRIVA RESPIMAT, repeat Turn–Open–Press for the second puff that completes the daily dose.',
    ],
    afterUseSteps: [
      'Close the cap after the prescribed puffs.',
      'If not used for more than 3 days, current SPIRIVA RESPIMAT IFU directs releasing 1 puff toward the ground before use.',
      'If not used for more than 21 days, re-prime until a mist is visible, then repeat 3 more times.',
    ],
    cleaningSteps: [
      'At least once weekly, wipe the mouthpiece including the metal part inside with a damp cloth or tissue only.',
      'Replace the inhaler when it locks at empty, expires, or 3 months after cartridge insertion—whichever comes first.',
    ],
    mistakes: [
      'Taking only one puff when the prescribed SPIRIVA daily dose is two puffs.',
      'Inhaling quickly instead of slowly and deeply.',
      'Covering the air vents.',
      'Skipping cartridge priming or confusing RESPIMAT with HandiHaler capsule technique.',
    ],
    patientSummaryAr:
        'RESPIMAT له تحضير أول مرة مختلف عن الاستخدام اليومي. بعد التحضير يصبح الاستخدام اليومي TOP: لف القاعدة حتى click، افتح الغطاء، ثم مع شهيق بطيء وعميق اضغط زر الجرعة. في SPIRIVA تكرر TOP مرة ثانية لإكمال البختين.',
    teachBackAr:
        'أرني خطوات TOP بالترتيب، وقل لي ماذا تفعل إذا لم يُستخدم الجهاز أكثر من 21 يومًا.',
    scopeNote:
        'This guide follows current SPIRIVA RESPIMAT IFU. Other RESPIMAT medicines use the same core device concept but can differ in labeled puff count and replacement details.',
    sourceLabel:
        'DailyMed · SPIRIVA RESPIMAT current IFU · 2026; Boehringer Ingelheim RESPIMAT Quick Start',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'Official RESPIMAT instruction videos',
        url: 'https://www.boehringer-ingelheim.com/nl/instructievideos-respimat-inhalator',
        isVideo: true,
      ),
      VisualGuideMediaLink(
        label: 'Official RESPIMAT Quick Start PDF',
        url: 'https://docs.boehringer-ingelheim.com/RESPIMAT-Quick-Start-Guide.pdf',
      ),
    ],
  ),
  VisualGuideData(
    id: 'nebulizer',
    title: 'Nebulizer',
    subtitle: 'Basic medication-nebulizer workflow.',
    icon: Icons.cloud_outlined,
    steps: [
      'Confirm the prescribed medication and exact nebulizer volume.',
      'Place the medicine in the nebulizer cup using the correct measuring method.',
      'Sit upright and use the mouthpiece or fitted mask.',
      'Breathe normally until the treatment is complete.',
      'Clean and dry the nebulizer parts according to the device instructions.',
    ],
    mistakes: [
      'Mixing nebulized medicines without confirmed compatibility.',
      'Using a poorly fitted mask.',
      'Leaving medication residue in an unclean device.',
    ],
    patientSummaryAr:
        'ضع الدواء بالكمية الموصوفة في حجرة النيبولايزر، اجلس بشكل مستقيم وتنفس بشكل طبيعي حتى انتهاء الجلسة. نظف أجزاء الجهاز بالطريقة الخاصة به بعد الاستخدام.',
  ),
  VisualGuideData(
    id: 'ear-drops',
    title: 'Ear drops',
    subtitle: 'Warm when allowed, position the affected ear upward, and follow the exact product penetration step.',
    icon: Icons.hearing_outlined,
    steps: [
      'Wash hands. If the product instructions allow it, warm the bottle or container in the hands to reduce dizziness from cold drops.',
      'Lie or tilt the head so the affected ear faces upward.',
      'Use the age- and product-appropriate ear-positioning technique and instill the prescribed number of drops without touching the dropper tip.',
      'Use the product-specific penetration step if required—for example, some ciprofloxacin/dexamethasone products instruct pumping the tragus.',
      'Keep the affected ear upward for the labeled period before sitting up; many current otic labels specify about 30–60 seconds or 60 seconds.',
    ],
    afterUseSteps: [
      'Repeat for the opposite ear only if it was prescribed for both ears.',
      'Do not use an ear product in the eye.',
      'Discard leftover suspension when the exact product label or course instructs you to do so.',
    ],
    mistakes: [
      'Using eye and ear products interchangeably.',
      'Skipping shaking for a suspension that specifically requires it.',
      'Instilling a very cold suspension and provoking dizziness.',
      'Standing up immediately so the dose drains out.',
      'Assuming every otic product is appropriate for a perforated eardrum or tympanostomy tube.',
    ],
    patientSummaryAr:
        'اجعل الأذن المصابة للأعلى، وضع العدد الموصوف من القطرات من دون لمس الفوهة. بعض المنتجات تحتاج رجًا أو تدفئة باليد أو ضغط الـtragus، لذلك اتبع نفس المنتج ولا تنقل طريقة قطرة أخرى.',
    teachBackAr:
        'أرني وضعية الرأس وقل لي كم ستبقى والأذن للأعلى، وهل منتجك يحتاج رجًا أو ضغط الـtragus؟',
    scopeNote:
        'Ear-drop formulation and indication matter: solution vs suspension, swimmer’s ear vs tympanostomy tube, and eardrum status can change instructions.',
    sourceLabel:
        'DailyMed · ciprofloxacin/dexamethasone otic suspension current labeling · 2026',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'DailyMed ciprofloxacin/dexamethasone otic instructions',
        url: 'https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=355fa56f-d7a8-444e-9dec-8ba1fa4ab0d8',
      ),
    ],
  ),
  VisualGuideData(
    id: 'prefilled-syringe',
    title: 'Prefilled syringe injection',
    subtitle: 'General subcutaneous prefilled-syringe framework.',
    icon: Icons.vaccines_outlined,
    steps: [
      'Confirm the correct medicine, strength and dose.',
      'Inspect the syringe and prepare the injection site.',
      'Use the product-specific angle and skin-fold technique.',
      'Inject the full prescribed dose as instructed.',
      'Dispose of the syringe immediately in a sharps container.',
    ],
    mistakes: [
      'Removing an air bubble when the product instructions say not to.',
      'Rubbing the site when the product advises against it.',
      'Reusing or recapping the syringe.',
    ],
    patientSummaryAr:
        'تأكد من اسم الدواء والجرعة قبل الحقن، استخدم الطريقة الخاصة بالسرنجة التي شرحها لك الصيدلي، ثم تخلص منها مباشرة في حاوية الأدوات الحادة.',
  ),
  VisualGuideData(
    id: 'oral-syringe',
    title: 'Oral syringe',
    subtitle: 'Accurate liquid-medicine measurement.',
    icon: Icons.straighten_outlined,
    steps: [
      'Confirm the medicine concentration and prescribed mL dose.',
      'Insert the oral syringe into the bottle adapter when available.',
      'Draw slightly more than needed, then remove air bubbles.',
      'Adjust to the exact mL mark at eye level.',
      'Give the medicine slowly into the inside of the cheek.',
    ],
    mistakes: [
      'Using a household spoon.',
      'Reading the syringe from the wrong edge of the plunger.',
      'Using the same mL amount after changing to a different concentration.',
    ],
    patientSummaryAr:
        'تأكد من تركيز الدواء والحجم المطلوب، اسحب الجرعة بالسرنجة الفموية حتى علامة mL الصحيحة، وأعطها ببطء داخل جانب الفم. لا تستخدم ملعقة منزلية.',
  ),

  VisualGuideData(
    id: 'handihaler-capsule-dpi',
    title: 'Capsule DPI / HandiHaler-type',
    subtitle:
        'Capsule-based dry-powder inhaler workflow; the capsule is inhaled through the device, not swallowed.',
    icon: Icons.air_rounded,
    steps: [
      'Confirm the exact capsule inhaler and matching inhalation capsule.',
      'Open/load and pierce the capsule exactly as the device instructions describe.',
      'Breathe out fully away from the mouthpiece.',
      'Seal lips around the mouthpiece and inhale deeply through the device.',
      'Follow the device-specific repeat-inhalation and capsule-disposal steps.',
    ],
    mistakes: [
      'Swallowing the inhalation capsule.',
      'Exhaling into the device.',
      'Using a capsule from a different inhaler system.',
    ],
    patientSummaryAr:
        'الكبسولة هنا للاستنشاق وليست للبلع. ضعها في جهازها المخصص وافتح/اثقب الكبسولة بالطريقة الخاصة بالجهاز، ثم أخرج الهواء بعيدًا عنه واستنشق بعمق. اتبع تعليمات نفس جهازك لأن خطوات الفتح وعدد مرات الاستنشاق قد تختلف.',
  ),
  VisualGuideData(
    id: 'contraceptive-vaginal-ring',
    title: 'Etonogestrel/EE vaginal ring',
    subtitle:
        'Compress and insert · 3 weeks in + 1 week out · expelled-ring timing matters.',
    icon: Icons.medication_outlined,
    steps: [
      'Wash and dry your hands, then remove the ring from its foil pouch.',
      'Choose a comfortable position, compress the ring between thumb and index finger, insert it into the vagina and gently push it farther up with a finger.',
      'The exact position is not critical. Leave the ring continuously in place for 3 weeks and check periodically that it is still present.',
      'Remove it after 3 weeks, keep the ring-free interval to exactly 1 week, then insert a new ring on the same weekday at about the same time.',
      'If it comes out for less than 3 hours, rinse with cool-to-lukewarm—not hot—water and reinsert promptly. Longer than 3 hours requires the week-specific backup plan.',
    ],
    mistakes: [
      'Trying to place the ring in one exact position instead of simply inserting it comfortably.',
      'Leaving it out for more than 3 hours without following the backup rules.',
      'Rinsing an expelled ring with hot water.',
      'Extending the ring-free interval beyond 7 days.',
    ],
    patientSummaryAr:
        'اضغطي الحلقة وأدخليها داخل المهبل؛ لا تحتاج مكانًا دقيقًا. اتركيها 3 أسابيع ثم أسبوعًا واحدًا فقط بدون حلقة. إذا خرجت أقل من 3 ساعات اغسليها بماء بارد إلى فاتر وأعيديها؛ إذا تجاوزت 3 ساعات اتبعي قواعد backup حسب أسبوع الدورة.',
  ),
  VisualGuideData(
    id: 'contraceptive-patch',
    title: 'Norelgestromin/EE contraceptive patch',
    subtitle:
        'Weekly ×3 · clean dry skin · 10-second press · check adhesion daily.',
    icon: Icons.medication_outlined,
    steps: [
      'Choose clean, dry, intact skin on the upper outer arm, abdomen, buttock or back; do not use the breast or apply over creams, oils, powders or makeup.',
      'Open the pouch only when ready to use, avoid touching the sticky surface more than necessary and apply the entire patch flat to the skin.',
      'Press firmly with the palm for 10 seconds, then smooth the edges and check every day that the patch remains fully attached.',
      'Replace on the same weekday for 3 consecutive weeks; Week 4 is patch-free. Never allow more than 7 consecutive patch-free days.',
      'If detached for less than 1 day, reapply or replace immediately. If detached for more than 1 day or for an unknown time, start a new cycle and use non-hormonal backup for 7 days.',
    ],
    mistakes: [
      'Applying to the breast, irritated skin, waistline or skin with lotion/oil.',
      'Cutting the patch or taping/wrapping a loose patch onto the skin.',
      'Forgetting to check the edges daily.',
      'Allowing more than 7 consecutive patch-free days.',
    ],
    patientSummaryAr:
        'ضعي اللاصقة على جلد نظيف وجاف في أعلى الذراع الخارجي أو البطن أو الأرداف أو الظهر، واضغطي 10 ثوانٍ. تُغيّر أسبوعيًا 3 أسابيع ثم أسبوع بدون لصقة. إذا انفصلت أكثر من يوم أو كانت المدة غير معروفة ابدئي دورة جديدة واستخدمي backup لمدة 7 أيام.',
  ),
  VisualGuideData(
    id: 'permethrin-scabies-full-body',
    title: 'Permethrin 5% scabies cream',
    subtitle:
        'Full-skin application · 8–14 hour contact time · wash off afterward.',
    icon: Icons.accessibility_new_outlined,
    steps: [
      'Apply the prescribed 5% cream to the full skin surface as directed, not only visible scabies lesions.',
      'Work systematically from the head/hairline as directed down to the soles, including commonly missed skin folds and spaces between fingers and toes.',
      'In infants, include the scalp, temples and forehead while keeping the cream away from the eyes and mouth.',
      'Leave the cream on for the full 8–14 hours without washing it off early.',
      'After the contact period, wash the cream off in a shower or bath.',
    ],
    mistakes: [
      'Spot-treating only the visible bumps.',
      'Washing the cream off before 8 hours.',
      'Automatically repeating treatment because itching continues for a few days.',
      'Confusing 5% scabies cream instructions with a permethrin lice product.',
    ],
    patientSummaryAr:
        'ضع Permethrin 5% على كامل الجلد حسب الوصفة وليس فقط على الحبوب، واتركه 8–14 ساعة ثم اغسله. لا تكرر العلاج مباشرة لمجرد استمرار الحكة، ولا تستخدم تعليمات منتج القمل بدل كريم الجرب.',
  ),
  VisualGuideData(
    id: 'forteo-pen',
    title: 'FORTEO delivery device',
    subtitle:
        'Product-specific daily teriparatide pen technique · new needle each dose · 5-count hold · refrigerated after use.',
    icon: Icons.colorize_outlined,
    steps: [
      'Check the FORTEO label, expiry and that the solution is clear and colorless with no particles.',
      'Attach a NEW compatible pen needle and remove the needle covers exactly as the User Manual shows.',
      'Pull the black injection button out until it stops and confirm the red stripe is visible.',
      'Insert into the prepared thigh or abdominal site, push the black injection button fully in, keep it pressed and slowly count to 5.',
      'Remove the needle, confirm the black button is fully in and no yellow shaft is showing, then remove/discard the needle, recap the pen and return it to the refrigerator immediately.',
    ],
    mistakes: [
      'Transferring FORTEO from the delivery device into a syringe.',
      'Leaving the needle attached between injections or reusing a needle.',
      'Giving a second injection the same day because the indicator looked uncertain.',
      'Leaving the device unrefrigerated or using it after 28 days from first use.',
    ],
    patientSummaryAr:
        'إبرة جديدة لكل جرعة. اسحب زر الحقن الأسود حتى يظهر الخط الأحمر، احقن في الفخذ أو البطن، اضغط الزر بالكامل واستمر ضاغطًا وأنت تعد ببطء إلى 5. بعد الجرعة انزع الإبرة، أعد الغطاء، وأرجع القلم للثلاجة مباشرة. لا تنقل الدواء إلى سرنجة.',
  ),
  VisualGuideData(
    id: 'tymlos-pen',
    title: 'TYMLOS pen',
    subtitle:
        'Product-specific abaloparatide pen · prime new pen Day 1 only · dose window 80 · 10-count hold.',
    icon: Icons.colorize_outlined,
    steps: [
      'Attach a NEW pen needle. For each NEW pen only, perform the Day-1 priming steps; do not repeat priming on Days 2–30.',
      'Turn the dose knob until 80 is aligned in the dose window.',
      'Choose a rotating lower-abdominal site, avoiding the 2-inch area around the navel, and insert the needle straight into the skin.',
      'Press the green injection button fully until 0 appears and keep pressing while counting to 10.',
      'Remove the needle straight out, safely remove/discard the pen needle, recap the pen and store the opened pen at room temperature 20–25°C.',
    ],
    mistakes: [
      'Priming on every dose instead of Day 1 of each new pen only.',
      'Injecting within 2 inches of the navel or failing to rotate sites.',
      'Releasing the green button before the full 10-count.',
      'Keeping the opened pen refrigerated by habit, leaving the needle attached, or using the pen beyond 30 days after first use.',
    ],
    patientSummaryAr:
        'اعمل priming مرة واحدة فقط في اليوم الأول لكل قلم جديد. اضبط الجرعة على 80، احقن أسفل البطن بعيدًا 2 إنش عن السرة، واضغط الزر الأخضر حتى يظهر 0 واستمر ضاغطًا وأنت تعد إلى 10. بعد أول استخدام يُحفظ القلم بدرجة الغرفة 20–25°C ويُرمى بعد 30 يومًا.',
  ),
  VisualGuideData(
    id: 'weekly-injection-device',
    title: 'Weekly injection device',
    subtitle:
        'Framework for weekly GLP-1/GIP medicines; exact pen, vial or multidose-device steps remain product-specific.',
    icon: Icons.vaccines_outlined,
    steps: [
      'Confirm the exact medicine, strength, presentation and weekly dose.',
      'Inspect the product and read the exact device IFU before first use.',
      'Prepare the injection site and any needle/device step required by that presentation.',
      'Administer the prescribed dose using the exact activation and hold-time instructions.',
      'Dispose/store the device according to its product-specific instructions.',
    ],
    mistakes: [
      'Using technique from a different brand or pen generation.',
      'Dialing or measuring a dose by clicks unless the exact IFU instructs it.',
      'Sharing pens, needles or multidose devices.',
    ],
    patientSummaryAr:
        'أول خطوة هي التأكد من اسم المنتج وشكل الجهاز لأن أقلام وعبوات semaglutide وtirzepatide ليست متطابقة. اتبع تعليمات نفس الجهاز في التحضير والحقن والحفظ ولا تنقل خطوات منتج إلى آخر.',
  ),  VisualGuideData(
    id: 'transdermal-patch',
    title: 'Transdermal patch',
    subtitle: 'General medicated-patch workflow; site and replacement schedule remain product-specific.',
    icon: Icons.layers_outlined,
    steps: [
      'Confirm the exact patch product and replacement schedule.',
      'Choose clean, dry, intact skin at a site allowed by that product.',
      'Remove the liner without touching the adhesive more than necessary.',
      'Apply the patch and press firmly, especially around the edges.',
      'Remove the old patch on schedule, fold adhesive sides together, and rotate sites.',
    ],
    mistakes: [
      'Using the same replacement schedule for every patch brand.',
      'Applying to oily, irritated, damaged, or prohibited skin sites.',
      'Leaving the old patch on when the new patch is applied.',
    ],
    patientSummaryAr:
        'تأكد أولًا من اسم اللاصقة وجدول تغييرها. ضعها على جلد نظيف وجاف وسليم في المكان المسموح لنفس المنتج، واضغط جيدًا على الحواف. عند موعد التغيير أزل اللاصقة القديمة وبدّل مكان اللصق حسب التعليمات.',
  ),


  VisualGuideData(
    id: 'nayzilam-device',
    title: 'NAYZILAM seizure-rescue spray',
    subtitle: 'One 5 mg dose per unit; second dose uses the opposite nostril after 10 minutes only if authorized.',
    icon: Icons.water_drop_outlined,
    steps: [
      'Keep the single-dose unit sealed in the blister until the seizure-cluster rescue plan says to use it.',
      'Do not test or prime the device.',
      'Insert the spray tip into one nostril and press the plunger once to deliver the full 5 mg dose.',
      'Observe breathing, alertness and seizure response.',
      'If the prescriber has authorized a second dose and it is still needed after 10 minutes, use a NEW unit in the opposite nostril.',
    ],
    mistakes: [
      'Testing or priming and losing the only dose.',
      'Reusing the first spray unit.',
      'Giving the second dose before 10 minutes or into the same nostril.',
      'Giving a second dose when breathing is concerning or sedation is excessive.',
    ],
    patientSummaryAr:
        'NAYZILAM جهاز جرعة واحدة 5 mg. لا تختبره قبل الاستخدام. أعطِ بخة واحدة في فتحة أنف واحدة؛ وإذا سمح الطبيب بجرعة ثانية بعد 10 دقائق فتكون بجهاز جديد في فتحة الأنف الأخرى. لا تعطِ الجرعة الثانية إذا كان التنفس مقلقًا أو النعاس شديدًا بشكل غير معتاد.',
  ),
  VisualGuideData(
    id: 'valtoco-device',
    title: 'VALTOCO seizure-rescue spray',
    subtitle: 'Device count depends on the prescribed dose; 15/20 mg use both nostrils.',
    icon: Icons.water_drop_outlined,
    steps: [
      'Check the exact prescribed VALTOCO dose before opening the blister.',
      'Do not test the single-use device.',
      'For a prescribed 5 mg or 10 mg dose, use one device and one spray in one nostril.',
      'For a prescribed 15 mg or 20 mg dose, use both devices in that dose pack: one spray in each nostril.',
      'If a second dose is prescribed, use a NEW blister pack no sooner than 4 hours after the first dose.',
    ],
    mistakes: [
      'Assuming every VALTOCO dose uses one device.',
      'Using only one device for a prescribed 15 mg or 20 mg dose.',
      'Repeating the dose before 4 hours.',
      'Testing a device before the emergency.',
    ],
    patientSummaryAr:
        'VALTOCO يختلف حسب الجرعة الموصوفة: 5 أو 10 mg = جهاز واحد في فتحة واحدة؛ 15 أو 20 mg = جهازان، بخة في كل فتحة. إذا كانت هناك جرعة ثانية موصوفة فلا تكون قبل 4 ساعات وتحتاج عبوة جديدة.',
  ),
  VisualGuideData(
    id: 'diastat-acudial-device',
    title: 'DIASTAT AcuDial rectal rescue system',
    subtitle: 'Pharmacist-locked dose with caregiver count-to-three administration technique.',
    icon: Icons.medical_services_outlined,
    steps: [
      'Before use, confirm the prescribed dose is visible in the dose window and the green READY band is visible.',
      'Place the patient on the side, expose the rectum and lubricate the rectal tip.',
      'Remove the cap and make sure the seal pin comes off with the cap.',
      'Insert the tip gently, then push the plunger slowly while counting aloud to 3.',
      'Count to 3 before removing the syringe, then hold the buttocks together while counting to 3 and continue observation.',
    ],
    mistakes: [
      'Trying to change a pharmacist-locked AcuDial dose.',
      'Using the device when the prescribed dose or green READY band is not visible.',
      'Skipping lubrication or forcing the tip.',
      'Removing the syringe immediately without the count-to-three sequence.',
    ],
    patientSummaryAr:
        'قبل DIASTAT AcuDial تأكد من الجرعة الظاهرة والشريط الأخضر READY. ضع المريض على جانبه، زيّت الطرف، أدخله بلطف، اضغط المكبس ببطء مع العد 1-2-3، انتظر 1-2-3 قبل إخراج السرنجة ثم اضغط الإليتين معًا 1-2-3.',
  ),
  VisualGuideData(
    id: 'gvoke-hypopen-device',
    title: 'GVOKE HypoPen',
    subtitle: 'Ready-to-use glucagon auto-injector; bare skin, click, 5-count, red window.',
    icon: Icons.vaccines_outlined,
    steps: [
      'Open the foil pouch only when the severe-hypoglycemia emergency occurs and inspect the solution.',
      'Pull the red needle cap straight off; keep fingers away from the yellow needle guard.',
      'Place the device straight down on bare skin of the lower abdomen, outer thigh or outer upper arm.',
      'Push and hold until you hear the click, then keep holding while slowly counting to 5.',
      'Confirm the viewing window is red, lift the device, turn an unconscious patient onto the side and call emergency medical help.',
    ],
    mistakes: [
      'Injecting through clothing.',
      'Covering the yellow needle guard with fingers.',
      'Lifting before the slow 5-count is complete or before the window turns red.',
      'Reusing the single-dose device.',
    ],
    patientSummaryAr:
        'GVOKE HypoPen: افتح الـfoil وقت الطوارئ، اسحب الغطاء الأحمر، ضع القلم مستقيمًا على جلد مكشوف، اضغط حتى تسمع click واستمر بالضغط مع العد ببطء إلى 5. اكتمال الجرعة يظهر عندما تصبح النافذة حمراء.',
  ),
  VisualGuideData(
    id: 'neffy-device',
    title: 'neffy epinephrine nasal spray',
    subtitle: 'Straight intranasal placement; do not sniff; second dose uses the same nostril after 5 minutes.',
    icon: Icons.water_drop_outlined,
    steps: [
      'Do not prime the single-dose device.',
      'Insert the nozzle fully into one nostril until the fingers touch the nose.',
      'Keep the device straight into the nose; do not angle toward the septum or outer nasal wall.',
      'Press the plunger firmly once and do not sniff during or after administration.',
      'If symptoms do not improve or worsen, use a NEW device in the SAME nostril starting 5 minutes after the first dose and follow the emergency plan.',
    ],
    mistakes: [
      'Priming the device.',
      'Angling the spray toward the septum or outer nasal wall.',
      'Sniffing during or after the dose.',
      'Using the opposite nostril for the second dose.',
    ],
    patientSummaryAr:
        'neffy: لا تختبر الجهاز. أدخل الفوهة كاملة واجعلها مستقيمة داخل الأنف، اضغط مرة واحدة ولا تشم أثناء أو بعد الرش. إذا احتجت جرعة ثانية فهي بجهاز جديد في نفس فتحة الأنف ابتداءً من 5 دقائق بعد الأولى.',
  ),


  VisualGuideData(
    id: 'tresiba-flextouch',
    title: 'TRESIBA FlexTouch U-100 / U-200',
    subtitle: 'No dose conversion; prime 2 units; hold for a slow 6-count.',
    icon: Icons.colorize_outlined,
    steps: [
      'Confirm TRESIBA and check whether the pen is U-100 or U-200.',
      'Attach a new needle and prime the pen with 2 units.',
      'Dial the prescribed number of insulin units directly; do not convert the dose.',
      'Inject subcutaneously and press the dose button until the counter returns to 0.',
      'Keep the needle in the skin and slowly count to 6 before removing it.',
    ],
    mistakes: [
      'Converting units between U-100 and U-200.',
      'Removing the needle before the slow 6-count is complete.',
      'Withdrawing insulin from a U-200 pen with a syringe.',
      'Storing the pen with a needle attached.',
    ],
    patientSummaryAr:
        'TRESIBA U-100 وU-200 يعرضان عدد الوحدات الحقيقي على القلم؛ لا تعمل أي تحويل. اعمل prime بـ2 units، اضبط الجرعة الموصوفة، وبعد رجوع العداد إلى 0 أبقِ الإبرة داخل الجلد وعد ببطء إلى 6.',
  ),
  VisualGuideData(
    id: 'humulin-n-kwikpen',
    title: 'HUMULIN N KwikPen',
    subtitle: 'Cloudy NPH insulin: roll 10 + invert 10 before attaching the needle.',
    icon: Icons.colorize_outlined,
    steps: [
      'Before attaching a needle, gently roll the pen between the hands 10 times.',
      'Invert the pen up and down 10 times.',
      'Confirm the insulin looks uniformly white and cloudy with no lumps or particles.',
      'Attach a new needle and prime with 2 units before the injection.',
      'Inject the prescribed dose and keep the dose knob pressed while slowly counting to 5 before removing the needle.',
    ],
    mistakes: [
      'Skipping resuspension or shaking the pen vigorously.',
      'Attaching the needle before mixing.',
      'Using the insulin if it remains clear or contains lumps/particles.',
      'Skipping the 2-unit prime or removing the needle before the 5-count.',
    ],
    patientSummaryAr:
        'HUMULIN N عكر ويحتاج خلطًا لطيفًا قبل كل جرعة: roll عشر مرات ثم invert عشر مرات قبل تركيب الإبرة. بعدها prime بـ2 units، والإنسولين الصحيح يكون أبيض وعكرًا بشكل متجانس.',
  ),
  VisualGuideData(
    id: 'humulin-r-u100-vial',
    title: 'HUMULIN R U-100 vial',
    subtitle: 'Clear regular insulin; U-100 syringe; approximately 30 minutes before a meal.',
    icon: Icons.medication_liquid_outlined,
    steps: [
      'Confirm the vial says HUMULIN R U-100 and the insulin is clear and colorless.',
      'Use a U-100 insulin syringe only for vial dosing.',
      'Draw the exact prescribed number of units using the U-100 scale.',
      'Inject subcutaneously at the site taught by the care team and rotate sites.',
      'For the usual subcutaneous regimen, take the prescribed dose about 30 minutes before the planned meal.',
    ],
    mistakes: [
      'Confusing U-100 with HUMULIN R U-500.',
      'Using the wrong syringe type.',
      'Injecting and then delaying or skipping the meal.',
      'Using cloudy, colored or particulate regular insulin.',
    ],
    patientSummaryAr:
        'HUMULIN R U-100 يجب أن يكون صافيًا وعديم اللون ويُسحب فقط بـU-100 insulin syringe. الجرعة تحت الجلد ترتبط عادة بالوجبة وتُعطى قبلها بنحو 30 دقيقة حسب الخطة.',
  ),
  VisualGuideData(
    id: 'humulin-70-30-kwikpen',
    title: 'HUMULIN 70/30 KwikPen',
    subtitle: 'Fixed premix: roll 10 + invert 10, prime 2, hold 5, meal in 30–45 minutes.',
    icon: Icons.colorize_outlined,
    steps: [
      'Before attaching a needle, gently roll the pen 10 times.',
      'Invert the pen 10 times until the suspension is uniformly white and cloudy.',
      'Attach a new needle and prime with 2 units.',
      'Dial and inject the prescribed dose; keep the dose knob pressed and slowly count to 5 before removing the needle.',
      'Follow the prescribed meal plan; current labeling places the injection approximately 30–45 minutes before the meal.',
    ],
    mistakes: [
      'Skipping the mixing step.',
      'Trying to change the 70:30 ratio or add another insulin to the pen.',
      'Injecting without a meal plan or delaying the meal after dosing.',
      'Keeping an in-use KwikPen longer than 10 days.',
    ],
    patientSummaryAr:
        'HUMULIN 70/30 خليط ثابت وعكر: roll عشر مرات + invert عشر مرات، ثم prime بـ2 units. بعد الحقن عد ببطء إلى 5، وتكون الجرعة عادة قبل الوجبة بـ30–45 دقيقة حسب الوصفة.',
  ),
  VisualGuideData(
    id: 'humulin-r-u500-device',
    title: 'HUMULIN R U-500',
    subtitle: 'Five-times-concentrated insulin; KwikPen and vial require different locked devices.',
    icon: Icons.warning_amber_rounded,
    steps: [
      'Verify the label says U-500 (500 units/mL) before every injection.',
      'KwikPen: prime with 5 units, then dial the prescribed insulin units directly; do not convert or count clicks.',
      'KwikPen: inject and keep the dose knob pressed while slowly counting to 5; never withdraw pen insulin with a syringe.',
      'Vial: use only a dedicated U-500 insulin syringe and read the prescribed units directly on that syringe.',
      'Follow the prescribed meal schedule; current labeling generally uses U-500 about 30 minutes before meals.',
    ],
    mistakes: [
      'Using a U-100, tuberculin or allergy syringe with a U-500 vial.',
      'Converting the prescribed units or counting pen clicks.',
      'Drawing insulin out of the U-500 KwikPen with a syringe.',
      'Mixing or diluting U-500 insulin.',
    ],
    patientSummaryAr:
        'U-500 تركيزه خمسة أضعاف U-100. في KwikPen اضبط الوحدات الموصوفة مباشرة بدون تحويل وprime بـ5 units؛ لا تسحب من القلم بسرنجة. إذا كان فيال U-500 استخدم فقط U-500 insulin syringe المخصصة.',
  ),


  VisualGuideData(
    id: 'rizatriptan-odt',
    title: 'Rizatriptan ODT',
    subtitle: 'Dry-hand orally disintegrating tablet technique; no liquid required.',
    icon: Icons.medication_outlined,
    steps: [
      'Keep the ODT in its original container until you are ready to take the dose.',
      'Open with dry hands and remove the tablet only immediately before dosing.',
      'Place the ODT on the tongue.',
      'Allow it to dissolve and swallow it with saliva; no liquid is required.',
      'Follow the prescribed repeat-dose rule rather than automatically redosing.',
    ],
    mistakes: [
      'Handling the ODT with wet hands.',
      'Removing it long before the dose and exposing it to moisture.',
      'Assuming a child can automatically take a second dose in the same 24 hours.',
      'Ignoring the propranolol-specific dose adjustment.',
    ],
    patientSummaryAr:
        'Rizatriptan ODT: استخدم يدين جافتين، أخرج الحبة فقط وقت الجرعة وضعها على اللسان لتذوب وتُبلع مع اللعاب. لا تحتاج ماء، ولا تفترض جرعة ثانية للأطفال أو عند استخدام propranolol دون مراجعة الوصفة.',
  ),
  VisualGuideData(
    id: 'nurtec-odt',
    title: 'NURTEC ODT',
    subtitle: 'Peel the blister foil; do not push the fragile ODT through it.',
    icon: Icons.medication_outlined,
    steps: [
      'Use dry hands.',
      'Peel back the foil covering one blister; do not push the ODT through the foil.',
      'Remove the ODT gently and use it immediately.',
      'Place it on or under the tongue and allow it to disintegrate in saliva.',
      'Swallow without additional liquid and do not store the ODT outside the opened blister.',
    ],
    mistakes: [
      'Pushing the ODT through the foil and breaking it.',
      'Handling it with wet hands.',
      'Opening the blister early and storing the tablet outside it.',
      'Confusing the as-needed acute schedule with the every-other-day preventive schedule.',
    ],
    patientSummaryAr:
        'NURTEC ODT: بيدين جافتين انزع الـfoil من الخلف ولا تدفع الحبة عبره. ضعها على اللسان أو تحته فورًا واتركها تذوب؛ لا تحتاج ماء. تأكد أيضًا هل الاستعمال للنوبة الحادة أم للوقاية كل يومين.',
  ),
  VisualGuideData(
    id: 'zavzpret-device',
    title: 'ZAVZPRET nasal spray',
    subtitle: 'Single-use 10 mg device: one spray into one nostril, no priming.',
    icon: Icons.water_drop_outlined,
    steps: [
      'Keep the device sealed until use and gently blow the nose first.',
      'Do not test, prime or press the plunger before dosing.',
      'Keep the head level and upright, close the opposite nostril and insert the nozzle comfortably into the open nostril.',
      'Slowly breathe in through the nose while firmly pressing the plunger once.',
      'Remove the device, keep the head level and breathe gently for 10–20 seconds.',
    ],
    mistakes: [
      'Testing or priming and losing the single dose.',
      'Using both nostrils for one dose.',
      'Tilting the head back or lying down during administration.',
      'Using more than one dose in 24 hours.',
      'Using an intranasal decongestant before ZAVZPRET or too soon afterward.',
    ],
    patientSummaryAr:
        'ZAVZPRET جهاز جرعة واحدة: لا تختبره. انفخ الأنف بلطف، أبقِ الرأس مستقيمًا، أغلق الفتحة الأخرى، خذ شهيقًا بطيئًا واضغط مرة واحدة في فتحة واحدة فقط، ثم أبقِ الرأس مستقيمًا 10–20 ثانية.',
  ),


  VisualGuideData(
    id: 'glycerin-adult-suppository',
    title: 'Adult glycerin suppository',
    subtitle:
        'Rectal use only · insert fully · retain 15 minutes · does not need to melt.',
    icon: Icons.medication_outlined,
    steps: [
      'Wash hands and remove the suppository from its wrapper.',
      'Lie on your side or use another comfortable position that allows gentle rectal insertion.',
      'Insert one adult suppository well into the rectum; do not swallow it.',
      'Try to retain the suppository for 15 minutes. It does not need to melt completely to work.',
      'Wash hands again and stay near a toilet; a bowel movement usually occurs within about 15–60 minutes.',
    ],
    mistakes: [
      'Swallowing the suppository.',
      'Inserting it only partially and immediately expelling it.',
      'Repeating more than one adult suppository in a day for the cited product.',
      'Continuing daily laxative self-treatment for more than 1 week without review.',
    ],
    patientSummaryAr:
        'افتح الغلاف، أدخل تحميلة واحدة جيدًا داخل المستقيم، وحاول الاحتفاظ بها 15 دقيقة. لا تحتاج أن تذوب بالكامل حتى تعمل. لا تُبلع ولا تكرر أكثر من تحميلة واحدة يوميًا لنفس المنتج.',
  ),
  VisualGuideData(
    id: 'canasa-suppository',
    title: 'CANASA mesalamine suppository',
    subtitle: 'Pointed end first; bedtime use; retain for 1–3 hours or longer.',
    icon: Icons.medication_outlined,
    steps: [
      'If possible, empty the rectum before the bedtime dose.',
      'Unwrap the suppository with minimal handling; do not cut or break it.',
      'Insert the suppository completely into the rectum, pointed end first, using gentle pressure.',
      'A small amount of lubricating gel may be used on the tip if needed.',
      'Try to retain the suppository for 1–3 hours or longer if possible.',
    ],
    mistakes: [
      'Cutting or breaking the suppository.',
      'Handling it too long until it begins to melt.',
      'Inserting it only partially.',
      'Using two suppositories together after a missed dose.',
    ],
    patientSummaryAr:
        'CANASA: أفرغ المستقيم إن أمكن، افتح الغلاف بأقل لمس، أدخل التحميلة كاملة بالطرف المدبب أولًا، ولا تقطعها. حاول الاحتفاظ بها 1–3 ساعات أو أكثر.',
  ),
  VisualGuideData(
    id: 'rowasa-enema',
    title: 'ROWASA mesalamine enema',
    subtitle: 'Shake, left-side/knee-chest position, retain overnight.',
    icon: Icons.medical_services_outlined,
    steps: [
      'Shake the bottle well and remove the protective sheath.',
      'Lie on the left side with the lower leg extended and the upper right leg flexed, or use the knee-chest position.',
      'Gently insert the applicator tip toward the umbilicus; never force it.',
      'Steadily squeeze the bottle to discharge the suspension.',
      'Remain in position for at least 30 minutes and aim to retain the dose overnight, approximately 8 hours.',
    ],
    mistakes: [
      'Skipping the shaking step.',
      'Forcing the applicator.',
      'Standing immediately after administration.',
      'Assuming standard ROWASA is sulfite-free.',
    ],
    patientSummaryAr:
        'ROWASA: رج العبوة، استلقِ على الجانب الأيسر أو وضعية knee-chest، أدخل الطرف بلطف باتجاه السرة واضغط بثبات. ابقَ في الوضعية 30 دقيقة على الأقل وحاول الاحتفاظ بالدواء طوال الليل.',
  ),

  VisualGuideData(
    id: 'sancuso-patch',
    title: 'SANCUSO granisetron patch',
    subtitle: 'Chemotherapy-linked antiemetic patch with exact timing, heat and sunlight precautions.',
    icon: Icons.layers_outlined,
    firstUseSteps: [
      'Keep the patch sealed in its pouch until you are ready to apply it.',
      'Plan application for 24–48 hours before chemotherapy begins.',
    ],
    steps: [
      'Choose clean, dry, nearly hairless, intact healthy skin on the upper outer arm.',
      'Open the pouch, remove the liners without touching the adhesive more than necessary, and apply one whole patch only.',
      'Press the patch firmly in place, especially around the edges, then wash your hands.',
      'Keep the patch on throughout chemotherapy and for at least 24 hours after chemotherapy is finished.',
      'Remove the patch by peeling it off gently; total wear may be up to 7 days depending on the chemotherapy regimen.',
    ],
    afterUseSteps: [
      'Fold the used patch in half with the sticky sides together and dispose of it safely away from children and pets.',
      'Keep the application site covered from direct natural or artificial sunlight for 10 days after removal.',
    ],
    mistakes: [
      'Cutting the patch.',
      'Applying more than one patch.',
      'Putting it on red, irritated or damaged skin.',
      'Using a heating pad or heat lamp over or near the patch.',
      'Exposing the patch site to direct sunlight or artificial UV without covering it.',
      'Removing it before at least 24 hours have passed after chemotherapy is finished.',
    ],
    patientSummaryAr:
        'ضع SANCUSO patch واحدة كاملة غير مقصوصة على جلد سليم ونظيف وجاف وقليل الشعر في أعلى الذراع من الخارج قبل chemotherapy بـ24–48 ساعة. اتركها أثناء العلاج وحتى 24 ساعة على الأقل بعد انتهائه، وبحد أقصى 7 أيام. تجنب heating pad/heat lamp والحرارة الطويلة، وغطِّ مكانها من أشعة الشمس أو UV أثناء الاستخدام ولمدة 10 أيام بعد نزعها.',
    teachBackAr:
        'أرني أين ستضع patch ومتى قبل chemotherapy. هل يجوز قصها؟ وماذا ستفعل مع الحرارة والشمس؟ ومتى تنزعها بعد انتهاء العلاج؟',
    scopeNote:
        'Use only for SANCUSO granisetron transdermal system. Do not generalize its timing, heat, UV or duration instructions to other medicated patches.',
    sourceLabel:
        'DailyMed · SANCUSO granisetron transdermal system · updated Nov 4, 2024',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'DailyMed SANCUSO label and Instructions for Use',
        url: 'https://dailymed.nlm.nih.gov/dailymed/lookup.cfm?setid=7379369a-03df-4ec3-8f2e-66645cc736d8',
      ),
    ],
  ),

  VisualGuideData(
    id: 'rivastigmine-patch',
    title: 'Rivastigmine transdermal patch',
    subtitle: 'One patch every 24 hours; remove the old patch first and rotate sites.',
    icon: Icons.layers_outlined,
    firstUseSteps: [
      'Confirm the prescribed patch strength and choose a consistent daily replacement time.',
      'Keep the patch in its sealed pouch until ready to apply.',
    ],
    steps: [
      'Remove yesterday’s patch before opening the new one. Only one patch should be worn at a time.',
      'Choose clean, dry, hairless, intact skin on the upper or lower back. If the back is not accessible, use the upper arm or chest.',
      'Do not apply over cream, lotion, powder, redness, cuts or irritated skin.',
      'Apply one patch and press firmly for about 30 seconds, especially around the edges.',
      'Replace every 24 hours at about the same time. Rotate sites and do not use the exact same spot again for at least 14 days.',
    ],
    afterUseSteps: [
      'Fold the used patch with adhesive sides together and discard safely away from children and pets.',
      'Wash hands with soap and water after removing the patch.',
    ],
    mistakes: [
      'Forgetting to remove yesterday’s patch.',
      'Wearing two patches at once.',
      'Applying over lotion, irritated skin or a cut.',
      'Using the exact same skin spot again within 14 days.',
      'Restarting the old higher strength after more than 3 days off treatment.',
      'Prolonged exposure to external heat such as excessive sunlight or sauna.',
    ],
    patientSummaryAr:
        'انزع patch القديمة أولًا ثم ضع واحدة جديدة فقط كل 24 ساعة. اختر جلدًا سليمًا ونظيفًا وجافًا في الظهر، أو أعلى الذراع/الصدر عند الحاجة. غيّر النقطة يوميًا ولا تستخدم نفس النقطة بالضبط قبل 14 يومًا. إذا توقفت أكثر من 3 أيام فلا ترجع لنفس القوة من نفسك.',
    teachBackAr:
        'أرني ماذا تفعل بالpatch القديمة قبل وضع الجديدة، وأين ستضع الجديدة، ومتى يمكن استخدام نفس النقطة مرة أخرى؟',
    scopeNote:
        'Product-specific guide for rivastigmine transdermal systems. Strength titration and restart after interruptions must follow the rivastigmine label.',
    sourceLabel:
        'DailyMed · Rivastigmine transdermal system / EXELON PATCH · current labeling',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'DailyMed rivastigmine transdermal instructions',
        url: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=4ab335d1-19ee-4cd9-9776-8086645d19e4',
      ),
    ],
  ),

  VisualGuideData(
    id: 'kesimpta-injection',
    title: 'KESIMPTA subcutaneous injection',
    subtitle: 'Single-use MS injection with loading weeks 0, 1, 2 then monthly from week 4.',
    icon: Icons.vaccines_outlined,
    firstUseSteps: [
      'The first injection should be performed under the guidance of a healthcare professional.',
      'Keep the pen or prefilled syringe refrigerated in the original carton until needed.',
      'Before use, remove the device from the refrigerator and allow it to reach room temperature for about 15–30 minutes.',
    ],
    steps: [
      'Inspect the solution; do not use it if it is cloudy or contains visible particles.',
      'Choose the abdomen, thigh, or outer upper arm. Avoid moles, scars, stretch marks, and tender, bruised, red, scaly, or hard skin.',
      'Use only one single-dose pen or prefilled syringe for the prescribed injection.',
      'Follow the exact device Instructions for Use for cap/needle handling and injection completion.',
      'Dispose of the used device immediately in an appropriate sharps container; do not reuse it.',
    ],
    afterUseSteps: [
      'Continue the loading calendar exactly: Weeks 0, 1 and 2, skip Week 3, then monthly from Week 4.',
      'If a dose is missed, administer it as soon as possible and then continue subsequent doses at the recommended intervals.',
    ],
    mistakes: [
      'Shaking or freezing the device.',
      'Injecting while the device is still very cold instead of allowing 15–30 minutes to warm naturally.',
      'Injecting into abnormal, bruised, scarred or irritated skin.',
      'Reusing the single-dose pen or syringe.',
      'Giving a Week 3 dose or starting monthly dosing before Week 4.',
      'Waiting until the next monthly date after a missed dose instead of giving it as soon as possible.',
    ],
    patientSummaryAr:
        'أول حقنة KESIMPTA تكون تحت إشراف مختص. أخرج القلم/السرنجة من الثلاجة واتركها 15–30 دقيقة لتصل لحرارة الغرفة دون رجّها أو تسخينها. احقن تحت الجلد في البطن أو الفخذ أو خارج أعلى الذراع وتجنب الجلد المتأذي. الجرعات Week 0 و1 و2، لا جرعة Week 3، ثم شهريًا من Week 4.',
    teachBackAr:
        'أرني أين يمكن الحقن، كم تنتظر بعد إخراج الجهاز من الثلاجة، وما جدول الأسابيع 0–4؟ وهل يجوز رج الجهاز أو إعادة استخدامه؟',
    scopeNote:
        'Product-specific guide for KESIMPTA Sensoready Pen/prefilled syringe. Device-specific cap/needle steps must follow the exact Instructions for Use supplied with the dispensed presentation.',
    sourceLabel:
        'DailyMed · KESIMPTA ofatumumab injection · revised Apr 2026',
    mediaLinks: [
      VisualGuideMediaLink(
        label: 'DailyMed KESIMPTA label and Instructions for Use',
        url: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6a8a3f53-2062-48ff-9dbe-b939df133ca3',
      ),
    ],
  ),

];


VisualGuideData? visualGuideById(String id) {
  for (final guide in visualGuideCatalog) {
    if (guide.id == id) return guide;
  }
  return null;
}

const medicationVisualGuideIds = <String, List<String>>{
  'etonogestrel-ethinyl-estradiol-vaginal-ring': ['contraceptive-vaginal-ring'],
  'norelgestromin-ethinyl-estradiol-patch': ['contraceptive-patch'],
  'permethrin-5-cream-scabies': ['permethrin-scabies-full-body'],
  'glycerin-adult-suppository-2g': ['glycerin-adult-suppository'],
  'teriparatide-forteo': ['forteo-pen'],
  'abaloparatide-tymlos': ['tymlos-pen'],
  'salbutamol-mdi': ['mdi', 'spacer'],
  'insulin-glargine': ['insulin-pen'],
  'budesonide-formoterol': ['symbicort-pmdi', 'turbuhaler'],
  'latanoprost': ['eye-drops'],
  'semaglutide-injection': ['weekly-injection-device'],
  'tiotropium-capsule-inhalation': ['handihaler-capsule-dpi'],
  'timolol-ophthalmic': ['eye-drops'],
  'ciprofloxacin-ophthalmic': ['eye-drops'],
  'ciprofloxacin-otic': ['ear-drops'],
  'ipratropium-hfa': ['mdi', 'spacer'],
  'fluticasone-hfa': ['mdi', 'spacer'],
  'fluticasone-salmeterol-dpi': ['diskus', 'dpi'],
  'tirzepatide-mounjaro': ['weekly-injection-device'],
  'albuterol-nebulizer-0083': ['nebulizer'],
  'albuterol-nebulizer-concentrate-05': ['nebulizer'],
  'ipratropium-nebulizer': ['nebulizer'],
  'ipratropium-albuterol-nebulizer': ['nebulizer'],
  'budesonide-nebulizer': ['nebulizer'],
  'tiotropium-respimat': ['respimat'],
  'fluticasone-nasal': ['nasal-spray'],
  'mometasone-nasal': ['nasal-spray'],
  'azelastine-nasal': ['nasal-spray'],
  'oxymetazoline-nasal': ['nasal-spray'],
  'amoxicillin-pediatric-suspension': ['oral-syringe'],
  'cefdinir-pediatric-suspension': ['oral-syringe'],
  'simethicone-infant-drops': ['oral-syringe'],
  'amoxicillin-clavulanate-augmentin-es600-suspension': ['oral-syringe'],
  'azithromycin-suspension-200mg5ml': ['oral-syringe'],
  'cephalexin-suspension-250mg5ml': ['oral-syringe'],
  'trimethoprim-sulfamethoxazole-suspension-200-40mg5ml': ['oral-syringe'],
  'nitrofurantoin-suspension-25mg5ml': ['oral-syringe'],
  'estradiol-transdermal-patch': ['transdermal-patch'],
  'dorzolamide-ophthalmic': ['eye-drops'],
  'olopatadine-ophthalmic-otc': ['eye-drops'],
  'prednisolone-acetate-ophthalmic': ['eye-drops'],
  'ofloxacin-otic': ['ear-drops'],
  'nayzilam-midazolam-nasal': ['nayzilam-device'],
  'valtoco-diazepam-nasal': ['valtoco-device'],
  'diastat-acudial-diazepam-rectal': ['diastat-acudial-device'],
  'gvoke-hypopen-glucagon': ['gvoke-hypopen-device'],
  'neffy-epinephrine-nasal': ['neffy-device'],
  'insulin-degludec-tresiba': ['tresiba-flextouch'],
  'humulin-n-nph': ['humulin-n-kwikpen'],
  'humulin-r-u100': ['humulin-r-u100-vial'],
  'humulin-70-30': ['humulin-70-30-kwikpen'],
  'humulin-r-u500': ['humulin-r-u500-device'],
  'rizatriptan-odt': ['rizatriptan-odt'],
  'rimegepant-nurtec-odt': ['nurtec-odt'],
  'zavegepant-zavzpret-nasal': ['zavzpret-device'],
  'mesalamine-canasa-suppository': ['canasa-suppository'],
  'mesalamine-rowasa-enema': ['rowasa-enema'],
  'granisetron-sancuso-patch': ['sancuso-patch'],
  'rivastigmine-transdermal': ['rivastigmine-patch'],
  'ofatumumab-kesimpta': ['kesimpta-injection'],
};

List<VisualGuideData> visualGuidesForMedication(String medicationId) {
  final ids = medicationVisualGuideIds[medicationId] ?? const <String>[];
  return ids
      .map(visualGuideById)
      .whereType<VisualGuideData>()
      .toList(growable: false);
}
