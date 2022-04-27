*Settings*

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Session
Test Teardown       Take Screenshot

*Test Cases*
Deve realizar um novo pedido em dinheiro

    ${order_json}       Get Json    order.json

    Go To Restaurants
    Choose Restaurant       ${order_json}

    FOR  ${product}      IN         @{order_json["products"]}
        Add To Cart                 ${product["name"]}
        Should Add To Cart          ${product["name"]}
    END

    Go Checkout
    Fill Data Customer      ${order_json["customer"]}
    Select Payment Option   ${order_json["payment"]}
    Pay order
    Order Should Be Completed
    