const IMP = window.IMP; // 생략 가능
IMP.init("imp52330146"); // 예: imp00000000a

const button= document.querySelector('button');

const onClickPay = async () => {
    IMP.request_pay({
        pg:"kakaopay",
        pay_method:"card",
        amount:"1",
        name: "매운 라면",
        merchant_uid: "ORD20231030-00001"
    })
};

button.addEventListener("click", onClickPay);