' Create PowerPoint application object
Set objPPT = CreateObject("PowerPoint.Application")

' Make PowerPoint visible
objPPT.Visible = True

' Add a new presentation
Set objPresentation = objPPT.Presentations.Add

' Add slides
Set slide1 = objPresentation.Slides.Add(1, 1) ' Introduction slide
slide1.Shapes(1).TextFrame.TextRange.Text = "Breast Cancer Diagnosis Using Support Vector Machine"
slide1.Shapes(2).TextFrame.TextRange.Text = "Introduction"

Set slide2 = objPresentation.Slides.Add(2, 2) ' SVM slide
slide2.Shapes(1).TextFrame.TextRange.Text = "Support Vector Machine (SVM)"
slide2.Shapes(2).TextFrame.TextRange.Text = "Explanation of SVM for Breast Cancer Diagnosis"

Set slide3 = objPresentation.Slides.Add(3, 2) ' Problem Forming Langrangian Dual slide
slide3.Shapes(1).TextFrame.TextRange.Text = "Problem Forming Langrangian Dual"
slide3.Shapes(2).TextFrame.TextRange.Text = "Mathematical Explanation of the Langrangian Dual Formulation"

Set slide4 = objPresentation.Slides.Add(4, 2) ' Matlab Code slide
slide4.Shapes(1).TextFrame.TextRange.Text = "Matlab Code"
slide4.Shapes(2).TextFrame.TextRange.Text = "Code Snippets for Implementing SVM in Matlab"

Set slide5 = objPresentation.Slides.Add(5, 2) ' Results slide
slide5.Shapes(1).TextFrame.TextRange.Text = "Results"
slide5.Shapes(2).TextFrame.TextRange.Text = "Presentation of Results Obtained Using SVM for Breast Cancer Diagnosis"

' Save the presentation
objPresentation.SaveAs "Breast_Cancer_Diagnosis_SVM_Presentation.pptx"

' Clean up
objPPT.Quit
Set objPPT = Nothing