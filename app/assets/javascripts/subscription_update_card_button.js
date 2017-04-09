var PayolaSubscriptionUpdateCard = {
  initialize: function () {
    $('.payola-subscription-update-card-button').on('click', function (e) {
      e.preventDefault();
      PayolaSubscriptionUpdateCard.handleUpdateCardButtonClick($(this));
    });
  },

  handleUpdateCardButtonClick: function (button) {
    var form    = button.parent('form');
    var options = form.data();

    var config_options = {
      key:                options.publishable_key,
      token:              function (token) {
        PayolaSubscriptionUpdateCard.tokenHandler(token, options);
      },
      name:               options.name,
      panelLabel:         options.panel_label,
      allowRememberMe:    options.allow_remember_me,
      locale:             options.locale,
      email:              options.email || undefined
    };

    if(options.image_path){
      $.extend(config_options, { image: options.image_path })
    }

    var handler = StripeCheckout.configure(config_options);
    handler.open();
  },

  tokenHandler: function (token, options) {
    $(".payola-subscription-update-card-button").prop("disabled", true);
    $(".payola-subscription-update-card-button-text").hide();
    $(".payola-subscription-update-card-button-spinner").show();

    var form = $("#" + options.form_id);
    form.append($('<input type="hidden" name="stripeToken">').val(token.id));
    form.append($('<input type="hidden" name="stripeEmail">').val(token.email));
    form.submit();
  }
};

if ('undefined' !== typeof Turbolinks) {
  $(document).on('page:change', PayolaSubscriptionUpdateCard.initialize);
} else {
  $(document).ready(PayolaSubscriptionUpdateCard.initialize);
}
