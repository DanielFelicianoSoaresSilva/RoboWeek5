*Settings*

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Session
Test Teardown       Take Screenshot

*Test Cases*
Deve adicionar um item ao carrinho

    #${name}     Set Variable        STARBUGS COFFEE
    #${desc}     Set Variable        Nada melhor que um café pra te ajudar a resolver um bug.

    &{restaurant}       Create Dictionary
    ...                 restaurant=STARBUGS COFFEE
    ...                 desc=Nada melhor que um café pra te ajudar a resolver um bug.

    Go To Restaurants
    Choose Restaurant           ${restaurant}
    #Choose Restaurant          ${name}     ${desc}
    Add To Cart                 Starbugs 500 error
    Should Add To Cart          Starbugs 500 error
    Total Cart Should Be        15,60

Deve adicionar três itens ao carrinho
    [tags]          temp

    ${cart_json}        Get JSON        cart.json

    Go To Restaurants
    Choose Restaurant               ${cart_json}

    FOR  ${product}      IN         @{cart_json["products"]}
        Add To Cart                 ${product["name"]}
        Should Add To Cart          ${product["name"]}
    END

    Total Cart Should Be        ${cart_json["total"]}
