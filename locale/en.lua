local Translations = {
    info = {
        ["attempt"] = "嘗試連接中...",
        ["checking"] = "您好 %s. 正在檢測相關資訊中..."
    },
    error = {
        ["failed"] = "連線失敗! 請聯繫管理員",
        ["ip"] = "查無此IP, 連接異常!",
        ["status"] = "API錯誤, 請聯繫管理員"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
