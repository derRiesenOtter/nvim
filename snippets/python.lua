return {
	s("fn", { t("def "), i(1), t("("), i(2), t({ "):", "    " }), i(3) }),
	s("main", { t({ "def main(): " }), i(1), t({ "", "", "", 'if __name__ == "__main__":', "\tmain()" }) }),
}
