import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  // Your code here
  api.decorateCookedElement((elem, helper) => {
    try {
        for (const p of elem.querySelectorAll(":scope > .lightbox-wrapper")) {
            const a = p.querySelector("a.lightbox");
            const i = a.querySelector("img");
            if (i.height / i.width >= 2) {
                const newi = document.createElement("img");
                // const newi = i.cloneNode();
                if (!a.href) {
                    continue;
                }
                newi.src = a.href;
                newi.style = i.style;
                newi.style.width = "100%";
                
                a.replaceChild(newi, i);
                p.style.width = "100%";
                a.style.width = "100%";
            }
        }
    } catch (err) {
        console.error(err);
    }
    
}, {
    id: "long-pic",
    onlyStream: true,
});

});
