return {
	s("p", { t({ "```{python}", "" }), i(1), t({ "", "```", "", "" }) }),
	s("r", { t({ "```{r}", "" }), i(1), t({ "", "```", "", "" }) }),
	s("j", { t({ "```{julia}", "" }), i(1), t({ "", "```", "", "" }) }),
	s("jh",
		{ t({ "---", "title: '" }), i(1, "title"), t("'"), t({ "", "date: " }), t(os.date("%Y-%m-%d")), t({ "",
			"author: Robin Ender", "engine: julia", "---", "", "" }) }),
	s("rh",
		{ t({ "---", "title: '" }), i(1, "title"), t("'"), t({ "", "date: " }), t(os.date("%Y-%m-%d")), t({ "",
			"author: Robin Ender", "---", "", "" }) }),
	s("ph",
		{ t({ "---", "title: '" }), i(1, "title"), t("'"), t({ "", "date: " }), t(os.date("%Y-%m-%d")), t({ "",
			"author: Robin Ender", "jupyter: python3", "---", "", "" }) }),
}, {
}
