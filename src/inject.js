(() => {
  const popupTags = [
    "app-upsell-blocking-bottom-sheet-direct",
    "app-upsell-blocking-bottom-sheet-seo",
  ];
  const popupSelector = popupTags.join(",");

  function removePopupFromNode(node) {
    if (!(node instanceof Element)) return;

    if (node.matches(popupSelector)) {
      node.remove();
      return;
    }

    node.querySelectorAll(popupSelector).forEach((el) => el.remove());
  }

  removePopupFromNode(document.documentElement);
})();
