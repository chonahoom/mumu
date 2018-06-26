$(document).ready(function () {
    function resetValue(addZone_clone) {
        //Goal Title Value값 초기화
        $(addZone_clone).children(":eq(4)")
            .children()
            .first()
            .prevObject[1].value = "";
        //Goal Description값 초기화
        $(addZone_clone).children(":eq(5)")
            .children()
            .first()
            .prevObject[1]
            .value = "[Issue, Gap]\n" +
            "\n" +
            "\n" +
            "[Target]\n" +
            "\n" +
            "\n" +
            "[Tasks '-':Must, '+']\n";
        //Evaluation comments by Self 값 초기화
        $(addZone_clone).children(":eq(6)")
            .children()
            .first()
            .prevObject[1]
            .value = "[Issue, Gap]\n" +
            "\n" +
            "\n" +
            "[Target]\n" +
            "\n" +
            "\n" +
            "[Tasks '-':Must, '+']\n";
        //Task due date 초기화
        $(addZone_clone).children(":eq(2)")
            .children()
            .first()
            .prevObject[0].value = "";
    }

    resetValueJQ = resetValue; // javascript 함수에 jQuery 함수 대입.
});