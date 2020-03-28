jQuery(".form-valide").validate({
    rules: {
        "val-userid": {
            required: !0,
            minlength: 5
        },
        "val-username": {
            required: !0,
            minlength: 2
        },
        "val-email": {
            required: !0,
            email: !0
        },
        "val-password": {
            required: !0,
            minlength: 8
        },
        "val-confirm-password": {
            required: !0,
            equalTo: "#val-password"
        },
        
        "val-phoneus": {
            required: !0,
            phoneUS: !0
        },
        "val-digits": {
            required: !0,
            digits: !0
        },
        "val-nickname": {
            required: !0,
            minlength: 3
        },
       
        "val-birth": {
            required: !0,
            minlength : 8 
        }
    },
    messages: {
		  "val-userid": {
	          required: "아이디를 입력해주세요",
	          minlength: "아이디는 최소 5자 이상입니다."
	      },
        "val-username": {
            required: "이름을 입력해주세요",
            minlength: "이름은 최소 2자 이상입니다."
        },
        "val-email": "유효한 이메일 주소를 입력해주세요",
        "val-password": {
            required: "패스워드를 입력해주세요",
            minlength: "패스워드는 최소 8자 이상입니다."
        },
        "val-confirm-password": {
            required: "패스워드를 입력해주세요",
            minlength: "패스워드는 최소 8자 이상입니다.",
            equalTo: "패스워드가 같지 않습니다. 다시 입력해주세요"
        },
        "val-nickname": {
            required: "닉네임을 입력해주세요",
            minlength: "닉네임은 최소 3자 이상입니다."
        },
        "val-birth": {
            required: "생년월일을 입력해주세요",
            minlength: "생년월일 8자를 입력해주세요"
        },
        "val-phoneus": "핸드폰 번호를 입력해주세요",
        "val-digits": "인증번호를 입력해주세요",
        
    },

    ignore: [],
    errorClass: "invalid-feedback animated fadeInUp",
    errorElement: "div",
    errorPlacement: function(e, a) {
        jQuery(a).parents(".form-group > div").append(e)
    },
    highlight: function(e) {
        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
    },
    success: function(e) {
        jQuery(e).closest(".form-group").removeClass("is-invalid"), jQuery(e).remove()
    },
});


jQuery(".form-valide-with-icon").validate({
    rules: {
        "val-username": {
            required: !0,
            minlength: 3
        },
        "val-password": {
            required: !0,
            minlength: 5
        }
    },
    messages: {
        "val-username": {
            required: "Please enter a username",
            minlength: "Your username must consist of at least 3 characters"
        },
        "val-password": {
            required: "Please provide a password",
            minlength: "Your password must be at least 5 characters long"
        }
    },

    ignore: [],
    errorClass: "invalid-feedback animated fadeInUp",
    errorElement: "div",
    errorPlacement: function(e, a) {
        jQuery(a).parents(".form-group > div").append(e)
    },
    highlight: function(e) {
        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
    },
    success: function(e) {
        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-valid")
    }




});