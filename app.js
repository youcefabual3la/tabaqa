/* ==========================================================================
   TABAQA MEDIA AGENCY — INTERACTIVE SCRIPT (app.js)
   Subframe 3D Hero Track, JellyRadio Physics, ReactBits Spotlight & WhatsApp
   ========================================================================== */

const translations = {
  ar: {
    brandName: "طبقة",
    brandFullName: "وكالة طبقة الإعلامية",
    slogan: "أنت في أي طبقة؟",
    navServices: "الخدمات",
    navCalculator: "اكتشف طبقتك",
    navShowcase: "أعمالنا",
    navFaq: "الأسئلة الشائعة",
    navContact: "تواصل معنا",
    startProject: "ابدأ مشروعك",
    
    // Subframe Hero 3D Track Tabs
    heroTab1: "هوية بصرية",
    heroTab2: "تصاميم ومواقع",
    heroTab3: "إعلانات وحسابات",

    // Hero
    heroTitle: "أنت في أي طبقة؟",
    heroSerifWord: "Which layer are you on?",
    heroSubhead: "نساعد العلامات التجارية والشركات على الارتفاع إلى الطبقة العلياء في سوقها عبر ابتكار الهويات البصرية، إدارة الحسابات، تصاميم السوشيال ميديا، وتطوير المواقع الاحترافية.",
    heroCtaPrimary: "تحدث معنا عبر واتساب",
    heroCtaSecondary: "مشاهدة الأعمال (Watch demo)",

    // Stats
    stat1: "هوية بصرية وتصميم متميز",
    stat2: "نسبة رضا وتفاعل العملاء",
    stat3: "موقع إلكتروني وصفحة هبوط",
    stat4: "مشاهدات حملات إعلانية ممولة",
    
    // Partner strip
    brandsTitle: "العلامات والقطاعات الوطنية التي نصعد بها",
    
    // Services Section
    servicesTitle: "الخدمات الرئيسية",
    servicesSubhead: "منظومة متكاملة من الحلول الإبداعية والتقنية المصممة بعناية للوصول بشركتك لأعلى مستويات الاحترافية.",
    
    s1Title: "تصميم الهويات البصرية",
    s1Desc: "نبتكر علامات تجارية فريدة تعبر عن هوية مشروعك وتترك انطباعاً احترافياً يدوم في أذهان عملائك.",
    s1Tag: "Branding & Identity",

    s2Title: "تصاميم السوشيال ميديا",
    s2Desc: "ننتج تصاميم إبداعية وجذابة مخصصة لمختلف منصات التواصل الاجتماعي لتعزيز حضورك الرقمي.",
    s2Tag: "Social Media Design",

    s3Title: "إدارة الحسابات والصفحات",
    s3Desc: "نتولى تخطيط المحتوى، جدولة النشر، والتفاعل مع المتابعين لضمان نمو مستمر وتفاعل حقيقي مع جمهورك.",
    s3Tag: "Account Management",

    s4Title: "تطوير وتصميم المواقع",
    s4Desc: "نصمم ونبني مواقع إلكترونية وصفحات هبوط (Landing Pages) سريعة، متجاوبة مع الأجهزة الذكية، ومصممة خصيصاً لتحويل الزوار إلى عملاء دائمين.",
    s4Tag: "Web Development",

    s5Title: "إدارة الحملات الإعلانية الممولة",
    s5Desc: "نخطط وننفذ إعلانات مدفوعة ومستهدفة بدقة للوصول إلى الجمهور المناسب وتحقيق أفضل عائد على استثمارك الإعلاني.",
    s5Tag: "Paid Ads & ROI",

    // FAQ Accordion
    faqTitle: "الأسئلة الشائعة",
    faqSubhead: "كل ما تحتاج معرفته عن طريقة عملنا، المواعيد، وآلية الاستلام والتنفيذ.",
    faq1Q: "كم يستغرق بناء وتصاميم الهوية البصرية والموقع؟",
    faq1A: "تستغرق الهوية البصرية المتكاملة عادة من 7 إلى 14 يوم عمل، بينما يستغرق تطوير الموقع الإلكتروني وتصميمه من 10 إلى 20 يوم عمل بحسب حجم وتفاصيل المشروع.",
    faq2Q: "كيف يتم متابعة الحملات الإعلانية وإدارة الحسابات؟",
    faq2A: "نوفر لكم تقارير أسبوعية وشهرية شاملة توضح نتائج الوصول، معدلات التفاعل، وتكلفة العائد على الاستثمار الإعلاني (ROAS) مع تحليلات التفاعل الحقيقي.",
    faq3Q: "هل المواقع الإلكترونية مصممة ومتجاوبة مع الجوال؟",
    faq3A: "نعم، جميع مواقنا وصفحات الهبوط تبنى بأحدث المعايير البرمجية لتكون متجاوبة 100% مع كافة الشاشات والأجهزة الذكية مع سرعة تحميل فائقة وترتيب محركات البحث SEO.",
    faq4Q: "كيف نبدأ المشروع وكيف يتم الدفع؟",
    faq4A: "نبدأ بجلسة استشارية وتحديد المتطلبات، يعقبها تقديم العقد وتوزيع الدفعات إلى مرحلتين (دفعة التأسيس ودفعة التسليم النهائي).",
    
    // Calculator
    calcTitle: "اكتشف طبقتك الحالية",
    calcSubhead: "حدد مرحلة مشروعك الحالية وسنقوم بتوجيهك للخدمة الأكثر تأثيراً لنمو أعمالك.",
    calcOpt1Title: "مرحلة التأسيس (الطبقة الأولى)",
    calcOpt1Desc: "مشروع جديد يحتاج هوية بصرية قوية وموقع إلكتروني لبناء الثقة.",
    calcOpt2Title: "مرحلة النمو والتوسع (الطبقة الثانية)",
    calcOpt2Desc: "مشروع قائم يرغب بزيادة المبيعات من خلال حملات إعلانية وتصاميم سوشيال ميديا مستمرة.",
    calcOpt3Title: "مرحلة السيطرة والريادة (الطبقة العلياء)",
    calcOpt3Desc: "علامة تجارية بارزة تتطلب إدارة كاملة وتطوير موقع إلكتروني مخصص متكامل.",
    calcResultBtn: "اطلب استشارة هذه الطبقة عبر واتساب",
    
    // Contact Banner
    contactTitle: "جاهز للصعود إلى الطبقة القادمة؟",
    contactDesc: "تواصل معنا مباشرة لنبدأ في دراسة مشروعك وبناء خطتك الإبداعية.",
    phoneLabel: "0533774116",
    instagramLabel: "@tabaqa.agency",

    // Rich Footer
    footerBio: "وكالة إعلامية متخصصة في ابتكار الهويات البصرية الفريدة، تصاميم التواصل الاجتماعي، إدارة الصفحات، وتطوير المواقع المتقدمة للحملات الإعلانية الناجحة.",
    footerServicesTitle: "الخدمات الإبداعية",
    footerNavTitle: "روابط سريعة",
    footerContactTitle: "معلومات التواصل",
    footerInquiryTitle: "طلب استشارة سريعة",
    workHours: "الأحد - الخميس: 9:00 ص - 6:00 م",
    locationText: "المملكة العربية السعودية",
    footerWhatsappBtn: "تحدث معنا عبر الواتساب (0533774116)",
    backToTop: "أعلى الصفحة",
    footerCopy: "© 2026 جميع الحقوق محفوظة لـ وكالة طبقة الإعلامية (Tabaqa Agency)"
  },
  en: {
    brandName: "Tabaqa",
    brandFullName: "Tabaqa Media Agency",
    slogan: "Which layer are you on?",
    navServices: "Services",
    navCalculator: "Layer Finder",
    navShowcase: "Work",
    navFaq: "FAQ",
    navContact: "Contact",
    startProject: "Start Project",

    // Subframe Hero 3D Track Tabs
    heroTab1: "Visual Identity",
    heroTab2: "Design & Web",
    heroTab3: "Ads & Accounts",
    
    // Hero
    heroTitle: "Which layer are you on?",
    heroSerifWord: "أنت في أي طبقة؟",
    heroSubhead: "We help brands and companies ascend to the top tier in their market through bespoke visual identities, social media management, strategic ads, and high-converting web development.",
    heroCtaPrimary: "Chat on WhatsApp",
    heroCtaSecondary: "Watch Demo",

    // Stats
    stat1: "Visual Identities & Brand Systems",
    stat2: "Client Satisfaction & Retention",
    stat3: "Websites & High-Converting Landing Pages",
    stat4: "Paid Campaign Impressions Delivered",
    
    // Partner strip
    brandsTitle: "Saudi Brands & Sectors We Elevate",
    
    // Services Section
    servicesTitle: "Core Services",
    servicesSubhead: "An integrated suite of creative and technical solutions engineered to position your enterprise at the highest standard.",
    
    s1Title: "Visual Identity Design",
    s1Desc: "We craft unique brand identities that embody your vision and leave a lasting, professional impression on your clients.",
    s1Tag: "Branding & Identity",

    s2Title: "Social Media Design",
    s2Desc: "We produce creative, high-converting graphic designs customized for various social platforms to solidify your digital presence.",
    s2Tag: "Social Media Design",

    s3Title: "Account & Page Management",
    s3Desc: "We manage content planning, publishing schedules, and community engagement to ensure continuous growth and active reach.",
    s3Tag: "Account Management",

    s4Title: "Web Design & Development",
    s4Desc: "We design and engineer lightning-fast, responsive websites and landing pages specifically tailored to turn visitors into loyal customers.",
    s4Tag: "Web Development",

    s5Title: "Paid Advertising Campaigns",
    s5Desc: "We plan and execute targeted paid ad campaigns to reach your ideal audience and deliver the highest return on ad spend (ROAS).",
    s5Tag: "Paid Ads & ROI",

    // FAQ Accordion
    faqTitle: "Frequently Asked Questions",
    faqSubhead: "Everything you need to know about our workflow, delivery timelines, and project steps.",
    faq1Q: "How long does visual identity design and web development take?",
    faq1A: "Full visual identity projects typically take 7 to 14 business days, while custom web development takes 10 to 20 business days depending on scope.",
    faq2Q: "How are ad campaigns and social accounts tracked?",
    faq2A: "We provide comprehensive weekly and monthly reports detailing reach, engagement rates, and Return on Ad Spend (ROAS).",
    faq3Q: "Are websites 100% mobile-friendly and optimized for SEO?",
    faq3A: "Yes, all our websites and landing pages are engineered to be 100% responsive across all mobile devices with ultra-fast load speeds and SEO optimization.",
    faq4Q: "How do we kick off a project and handle payments?",
    faq4A: "We start with a discovery session, followed by contract signing and milestone payments (deposit & final delivery).",
    
    // Calculator
    calcTitle: "Discover Your Current Layer",
    calcSubhead: "Select your current business stage, and we'll recommend the highest-impact strategy for your growth.",
    calcOpt1Title: "Foundational Stage (Layer 1)",
    calcOpt1Desc: "New business requiring a solid visual identity and modern website to establish credibility.",
    calcOpt2Title: "Growth & Scaling Stage (Layer 2)",
    calcOpt2Desc: "Established business looking to increase sales via continuous social media design & paid ads.",
    calcOpt3Title: "Market Leadership (Top Layer)",
    calcOpt3Desc: "Prominent brand needing full-suite account management and custom web ecosystem.",
    calcResultBtn: "Request Layer Strategy on WhatsApp",
    
    // Contact Banner
    contactTitle: "Ready to ascend to the next layer?",
    contactDesc: "Reach out directly to analyze your project and construct your bespoke creative roadmap.",
    phoneLabel: "0533774116",
    instagramLabel: "@tabaqa.agency",

    // Rich Footer
    footerBio: "Media agency specializing in bespoke visual identities, social media production, page management, and high-converting web engineering.",
    footerServicesTitle: "Creative Services",
    footerNavTitle: "Quick Links",
    footerContactTitle: "Contact Information",
    footerInquiryTitle: "Quick Consultation",
    workHours: "Sun - Thu: 9:00 AM - 6:00 PM",
    locationText: "Kingdom of Saudi Arabia",
    footerWhatsappBtn: "Chat on WhatsApp (0533774116)",
    backToTop: "Back to Top",
    footerCopy: "© 2026 All Rights Reserved — Tabaqa Media Agency"
  }
};

let currentLang = 'ar';

function setLanguage(lang) {
  currentLang = lang;
  document.documentElement.setAttribute('lang', lang);
  document.documentElement.setAttribute('dir', lang === 'ar' ? 'rtl' : 'ltr');
  
  // Update language button text
  const switchText = document.getElementById('lang-switch-text');
  if (switchText) {
    switchText.textContent = lang === 'ar' ? 'English' : 'عربي';
  }
  const switchBtn = document.getElementById('lang-switch-btn');
  if (switchBtn && !switchText) {
    switchBtn.textContent = lang === 'ar' ? 'English' : 'عربي';
  }

  // Update all i18n elements (preserve innerHTML for elements with child icons)
  document.querySelectorAll('[data-i18n]').forEach(el => {
    const key = el.getAttribute('data-i18n');
    if (translations[lang] && translations[lang][key]) {
      el.textContent = translations[lang][key];
    }
  });

  // Hero bilingual title — always show both, but swap primary/secondary
  const heroTitleMain = document.querySelector('.hero-title-main');
  const heroTitleEn = document.querySelector('.hero-title-en');
  if (heroTitleMain && heroTitleEn) {
    if (lang === 'ar') {
      heroTitleMain.textContent = 'أنت في أي طبقة؟';
      heroTitleEn.textContent = 'Which layer are you on?';
      heroTitleEn.setAttribute('dir', 'ltr');
    } else {
      heroTitleMain.textContent = 'Which layer are you on?';
      heroTitleMain.style.fontFamily = "'Inter','Arial',sans-serif";
      heroTitleEn.textContent = 'أنت في أي طبقة؟';
      heroTitleEn.removeAttribute('dir');
    }
  }

  updateCalculatorResult();
}

// Subframe 3D Hero Track Interactive Switching with JellyRadio Physics
const heroTabData = {
  ar: {
    1: {
      subhead: "نصمم هويات بصرية متكاملة وشعارات فريدة تجعل علامتك التجارية الخيار الأول والأقوى في تفكير عملائك.",
      tag: "Identity & Logos // 2026",
      title: "ابتكار الهويات الرقمية بعمق أحادي اللون",
      desc: "تتميز هويات طبقة بالوضوح البصري والتركيز على التفاصيل الدقيقة، مما يمنح العلامة وقاراً وسلطة في سوقها المستهدف."
    },
    2: {
      subhead: "نصمم ونبني مواقع إلكترونية وصفحات هبوط فائقة السرعة ومتجاوبة تماماً لتحويل الزوار إلى عملاء دائمين.",
      tag: "Web & UI Systems // 2026",
      title: "تطوير مواقع وصفحات هبوط عالية التحويل",
      desc: "نعتمد أحدث تقنيات الويب العالمية مع واجهات مستخدم مخصصة تعكس تميز خدماتك وترفع نسبة التحويل (CRO)."
    },
    3: {
      subhead: "نتولى إدارة حساباتك بالكامل مع التخطيط الاستراتيجي للحملات الإعلانية الممولة لتحقيق أعلى عائد استثماري.",
      tag: "Ads & Growth // 2026",
      title: "إدارة الحملات الإعلانية ومضاعفة المبيعات",
      desc: "استهداف دقيق واستراتيجيات محتوى متجددة تضمن نمواً مستمراً للحسابات وتفاعلاً حقيقياً مع جمهورك المستهدف."
    }
  },
  en: {
    1: {
      subhead: "We design complete visual identities and unique logos that position your brand as the premier choice in your clients' minds.",
      tag: "Identity & Logos // 2026",
      title: "Crafting Digital Identities with Monochromatic Depth",
      desc: "Tabaqa's identity work focuses on visual clarity and refined craftsmanship, providing your brand with authority in its market."
    },
    2: {
      subhead: "We engineer lightning-fast, responsive websites and landing pages built to turn visitors into long-term clients.",
      tag: "Web & UI Systems // 2026",
      title: "High-Converting Web & Landing Page Engineering",
      desc: "We leverage modern web standards paired with custom UI design to showcase your services and maximize conversion rates."
    },
    3: {
      subhead: "Full-suite account management and strategic ad campaigns targeted to maximize your return on ad spend (ROAS).",
      tag: "Ads & Growth // 2026",
      title: "Ad Campaign Management & Sales Scaling",
      desc: "Precision targeting and continuous content strategies that ensure steady organic growth and high customer engagement."
    }
  }
};

function switchHeroTab(index) {
  document.querySelectorAll('.jelly-radio-chip').forEach((chip, idx) => {
    if (idx + 1 === index) {
      chip.setAttribute('data-active', 'true');
      chip.setAttribute('aria-checked', 'true');
    } else {
      chip.setAttribute('data-active', 'false');
      chip.setAttribute('aria-checked', 'false');
    }
  });

  const data = heroTabData[currentLang][index];
  const subheadEl = document.getElementById('hero-dynamic-subhead');
  const tagEl = document.getElementById('showcase-tag');
  const titleEl = document.getElementById('showcase-title');
  const descEl = document.getElementById('showcase-desc');

  if (subheadEl && data) {
    subheadEl.style.opacity = 0;
    setTimeout(() => {
      subheadEl.textContent = data.subhead;
      subheadEl.style.opacity = 1;
    }, 150);
  }

  if (tagEl && titleEl && descEl && data) {
    tagEl.textContent = data.tag;
    titleEl.textContent = data.title;
    descEl.textContent = data.desc;
  }
}

// REACT BITS: Spotlight Card Mouse Tracker
function initSpotlightCards() {
  document.querySelectorAll('.spotlight-card').forEach(card => {
    card.addEventListener('mousemove', e => {
      const rect = card.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;
      card.style.setProperty('--mouse-x', `${x}px`);
      card.style.setProperty('--mouse-y', `${y}px`);
    });
  });
}

// REACT BITS: Accordion Toggling
function initAccordions() {
  document.querySelectorAll('.accordion-header').forEach(header => {
    header.addEventListener('click', () => {
      const item = header.parentElement;
      const isOpen = item.classList.contains('open');
      
      document.querySelectorAll('.accordion-item').forEach(el => el.classList.remove('open'));
      
      if (!isOpen) {
        item.classList.add('open');
      }
    });
  });
}

// Layer Calculator Logic
let selectedLayer = 1;

const layerData = {
  ar: {
    1: { name: "الطبقة الأولى (التأسيسية)", rec: "نوصي بـ: تصميم الهوية البصرية + تطوير موقع إلكتروني احترافي لبناء الثقة." },
    2: { name: "الطبقة الثانية (النمو والتوسع)", rec: "نوصي بـ: تصاميم السوشيال ميديا + إدارة الحملات الإعلانية الممولة لزيادة الحصيلة." },
    3: { name: "الطبقة العلياء (الريادة)", rec: "نوصي بـ: المنظومة المتكاملة (إدارة كاملة للمحتوى + تطوير موقع مخصص + إعلانات مكثفة)." }
  },
  en: {
    1: { name: "Layer 1 (Foundational)", rec: "Recommended: Visual Identity Design + Professional Website." },
    2: { name: "Layer 2 (Growth & Scaling)", rec: "Recommended: Social Media Design + Targeted Paid Ads." },
    3: { name: "Top Layer (Market Leadership)", rec: "Recommended: Full Suite Management + Bespoke Web & Ad Campaigns." }
  }
};

function selectLayer(layerIndex) {
  selectedLayer = layerIndex;
  document.querySelectorAll('.calc-option-card').forEach((card, idx) => {
    if (idx + 1 === layerIndex) {
      card.classList.add('selected');
    } else {
      card.classList.remove('selected');
    }
  });
  updateCalculatorResult();
}

function updateCalculatorResult() {
  const titleEl = document.getElementById('calc-result-title');
  const descEl = document.getElementById('calc-result-desc');
  const data = layerData[currentLang][selectedLayer];
  if (titleEl && descEl && data) {
    titleEl.textContent = data.name;
    descEl.textContent = data.rec;
  }
}

function sendWhatsAppQuote(serviceName) {
  const phone = '966533774116';
  let message = '';
  if (serviceName) {
    message = currentLang === 'ar' 
      ? `مرحباً وكالة طبقة، أود الاستفسار عن خدمة: ${serviceName}`
      : `Hello Tabaqa Agency, I would like to inquire about: ${serviceName}`;
  } else {
    const data = layerData[currentLang][selectedLayer];
    message = currentLang === 'ar'
      ? `مرحباً وكالة طبقة، قمت باختيار (${data.name}) من حاسبة الطبقات وأود البدء بالمشروع!`
      : `Hello Tabaqa Agency, I selected (${data.name}) from the Layer Calculator and would like to start!`;
  }
  
  const url = `https://wa.me/${phone}?text=${encodeURIComponent(message)}`;
  window.open(url, '_blank');
}

function sendFooterInquiry() {
  const input = document.getElementById('footer-inquiry-input');
  const value = input ? input.value.trim() : '';
  const phone = '966533774116';
  const message = currentLang === 'ar'
    ? `مرحباً وكالة طبقة، أود مناقشة تفاصيل مشروع: ${value || 'مشروع جديد'}`
    : `Hello Tabaqa Agency, I would like to discuss project details: ${value || 'New project'}`;
  
  const url = `https://wa.me/${phone}?text=${encodeURIComponent(message)}`;
  window.open(url, '_blank');
}

// DOM Initialization
document.addEventListener('DOMContentLoaded', () => {
  // Mobile Menu Toggle
  const mobileToggle = document.getElementById('mobile-toggle');
  const navLinks = document.getElementById('nav-links');
  if (mobileToggle && navLinks) {
    mobileToggle.addEventListener('click', () => {
      navLinks.classList.toggle('open');
    });
  }

  // Language Switch
  const langBtn = document.getElementById('lang-switch-btn');
  if (langBtn) {
    langBtn.addEventListener('click', () => {
      setLanguage(currentLang === 'ar' ? 'en' : 'ar');
    });
  }

  // Layer Option Selection
  document.querySelectorAll('.calc-option-card').forEach((card, idx) => {
    card.addEventListener('click', () => {
      selectLayer(idx + 1);
    });
  });

  // Init Spotlight & Accordions
  initSpotlightCards();
  initAccordions();

  // Default Language Setup
  setLanguage('ar');
});
