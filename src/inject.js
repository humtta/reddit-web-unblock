(() => {
  const popupTags = [
    "app-upsell-blocking-bottom-sheet-direct",
    "app-upsell-blocking-bottom-sheet-seo",
  ];
  const popupSelector = popupTags.join(",");

  function isPopup(node) {
    return (
      node.nodeType === Node.ELEMENT_NODE &&
      popupTags.includes(node.tagName.toLowerCase())
    );
  }
})();
