install.packages("RSelenium")
install.packages("wdman")
library(RSelenium)

library(wdman)


driver<- rsDriver(port=4445L,browser = "chrome",verbose = FALSE, check = FALSE)

remDr <- driver$client
remDr$navigate("https://www.tpr.scee.net/SCEGlobalSystems/GlobalSignIn/SystemAccess/CFModules/Logon/gsi_logon_screen.cfm?v_timeout_flag=Y&v_which_system=SCEE_TPRNET")

## 아이디입력
username <- remDr$findElement(using = "id", value = "v_logon_name")
username$sendKeysToElement(list("실제 ID"))

## 비번입력
passwd <- remDr$findElement(using = "id", value = "v_password")
passwd$sendKeysToElement(list("실제 Password"))

## 로그인 버튼클릭

morereviews <- remDr$findElement(using = 'id', value = "sign_in_btn")
morereviews$clickElement()

## 데이터 받을 곳으로 이동

remDr$navigate("https://www.tpr.scee.net/PublisherDeveloperRelations/AreaPDR/MainSystem/CFModules/ScreenLayout/pdr_master_template.cfm?pdr_what_screen=PSN_REPORTS_PS4&pdr_what_left_menu=NONE")


## 셀레니움 종료

remDr$close()

## 드라이버 사용종료

rm(driver)

## 메모리 삭제

gc()