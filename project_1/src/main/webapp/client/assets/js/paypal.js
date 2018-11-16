
paypal.Button.render({
    // Configure environment
    env: 'sandbox',
    client: {
        sandbox: 'demo_sandbox_client_id',
        production: 'demo_production_client_id'
    },
    // Customize button (optional)
    locale: 'en_US',
    style: {
        size: 'small',
        color: 'gold',
        shape: 'pill',
    },

    // Enable Pay Now checkout flow (optional)
    commit: true,

    // Set up a payment
    payment: function(data, actions) {
        return actions.payment.create({
            transactions: [{
                amount: {
                    total: $('#subTotal').val(),
                    currency: 'USD'
                }
            }]
        });
    },
    // Execute the payment
    onAuthorize: function (data, actions) {
        return actions.payment.execute().then(function () {
            // Show a confirmation message to the buyer
            $.ajax({
                headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
                type: "POST",
                url: '/orders/purchase',
                data: {cartId: parseInt($('#cartId').val())},
                success: function () {
                    alert('Thank you for your purchase!');
                    window.location = '/home';
                },
                error: function (callback) {
                    alert('Error during purchase!');
                }
            });
        });
    }
}, '#paypal-button');
