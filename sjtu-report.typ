// 上海交通大学课程报告模板样式文件
// Typst 版本
// 原LaTeX模板: https://github.com/Jiazhen-Lei/SJTU_Course_Template_Latex

// 文本框函数

#let MAIN = ("Times New Roman", "SimSun")
#let TITLE = ("Times New Roman", "SimHei")

#let tbox(content) = {
  align(center)[
    #box(
      fill: gray.lighten(90%),
      stroke: 0.5pt + black,
      radius: 2pt,
      inset: 8pt,
      width: 8cm,
      content
    )
  ]
}

// 主模板函数
#let sjtu-report(
  title: "课程报告",
  lang: "zh",
  subtitle: "",
  school: "学院名称",
  class: "班级",
  student-id: "学号", 
  author: "姓名",
  date: datetime.today(),
  header: "",
  logo: none,
  body
) = {
  
  // 文档基本设置
  set document(
    title: title,
    author: author,
    date: date,
  )
  
  // 页面设置
  set page(
    paper: "a4",
    margin: 2.5cm,
    header: if header != "" {
      align(center)[
        #set text(font: MAIN, size: 10pt)
        #header
      ]
    } else { none },
    header-ascent: 1cm,
    numbering: "1",
  )
  
  // 字体设置
  set text(
    font: MAIN,
    size: 12pt,
    lang: "zh",
    region: "cn",
  )
  
  // 中文字体设置
  show regex("[^\x00-\x7F]+"): set text(font: MAIN)
  
  // 标题设置
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    set text(font: TITLE, size: 16pt, weight: "bold")
    it
    v(0.5em)
  }
  show heading.where(level: 2): it => {
    set text(font: TITLE, size: 14pt, weight: "bold")  
    it
    v(0.3em)
  }
  
  // 数学公式设置
  set math.equation(numbering: "(1)")
  
  // 图表编号设置
  set figure.caption(separator: [ ])
  show figure.where(kind: image): set figure.caption(position: bottom)
  show figure.where(kind: table): set figure.caption(position: top)
  
  // 参考文献设置
  set bibliography(style:"gb-7714-2015-numeric")
  
  // 链接设置
  show link: set text(fill: blue)
  
  // 封面页
  page(
    margin: 2.5cm,
    header: none,
    footer: none,
    numbering: none,
  )[
    #set align(center)
    
    // 校徽/校名logo
    #if logo != none {
      v(2cm)
      image(logo, width: 60%)
    } else {
      v(5cm)
    }
    
    // 标题
    #v(if logo != none { 1cm } else { 3cm })
    #set text(font: TITLE, size: 24pt, weight: "bold")
    #title
    
    #v(1cm)
    #set text(font: TITLE, size: 18pt, weight: "bold")
    #if subtitle != "" {
      underline(subtitle)
    }
    
    #v(if logo != none { 2cm } else { 3cm })
    
    // 个人信息
    #set text(font: "KaiTi", size: 16pt)
    #grid(
      columns: 2,
      column-gutter: 1cm,
      row-gutter: 0.8cm,
      align: (right, left),
      [学院], [#underline(pad(x: 4cm)[#school])],
      [班级], [#underline(pad(x: 4cm)[#class])],
      [学号], [#underline(pad(x: 4cm)[#student-id])],
      [姓名], [#underline(pad(x: 4cm)[#author])],
    )
    
    #v(2cm)
    #set text(font: MAIN, size: 14pt)
    #date.display("[year]年[month]月[day]日")
  ]
  
  // 目录页
  page(
    header: none,
    footer: none,
    numbering: none,
  )[
    #outline(
      title: [
        #set text(font: TITLE, size: 18pt, weight: "bold")
        #align(center)[目录]
      ],
      indent: 2em,
      depth: 3,
    )
  ]
  
  // 正文页码从1开始
  counter(page).update(1)
  
  // 正文内容
  body
  
  // 参考文献
  bibliography("reference.bib", title: [
    #set text(font: TITLE, size: 16pt, weight: "bold")
    #align(center)[参考文献]
  ])
}