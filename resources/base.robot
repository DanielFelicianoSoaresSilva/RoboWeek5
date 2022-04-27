*Settings*
Documentation       Arquivo base do projeto

Library     Browser
#para usar o arquivo Json
Library     OperatingSystem

Resource    actions/search.robot
Resource    actions/cart.robot
Resource    actions/order.robot

*Variables*
${DEFAULT_TIMEOUT}      10

*Keywords*
Start Session

    #New Browser            chromium            False              slowMo=00:00:00.5
    New Browser             ${browser}           ${headless}        slowMo=00:00:00.5
    New Page                http://parodifood.qaninja.academy/
    Set Viewport Size       1280    768
    Get Text                text=Nunca foi tão engraçado pedir comida

### Helpers ###
Get Json
    [Arguments]     ${file_name}

    ${file}         Get File        ${EXECDIR}/resources/fixtures/${file_name}
    #converter para super variavel
    ${super_var}    Evaluate        json.loads($file)   json

    [return]        ${super_var}
