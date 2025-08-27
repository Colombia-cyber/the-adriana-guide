#!/usr/bin/env bash
set -euo pipefail

BRANCH="colombia-cyber-starter"

echo "Fetching latest from origin..."
git fetch origin

# Try to set the branch to the remote branch if it exists, otherwise create from main
if git ls-remote --heads origin "${BRANCH}" | grep -q "${BRANCH}"; then
  git checkout -B "${BRANCH}" "origin/${BRANCH}"
else
  # create branch from main (or current HEAD if main not present)
  if git show-ref --verify --quiet refs/heads/main; then
    git checkout -B "${BRANCH}" main
  else
    git checkout -B "${BRANCH}"
  fi
fi

mkdir -p public/images src/components

cat > .gitignore <<'EOF'
/node_modules
/dist
/.env
.DS_Store
.vscode
npm-debug.log
EOF

cat > vite.config.js <<'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
})
EOF

cat > public/images/colombian-flag.svg <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="360" viewBox="0 0 600 360" role="img" aria-label="Colombian flag">
  <rect width="600" height="360" fill="#FFD100"/>
  <rect y="180" width="600" height="90" fill="#0038A8"/>
  <rect y="270" width="600" height="90" fill="#CE1126"/>
</svg>
EOF

cat > public/images/colombian-flag-burning.svg <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="360" viewBox="0 0 600 360" role="img" aria-label="Colombian flag with stylized flame">
  <rect width="600" height="360" fill="#FFD100"/>
  <rect y="180" width="600" height="90" fill="#0038A8"/>
  <rect y="270" width="600" height="90" fill="#CE1126"/>
  <g transform="translate(360,40) scale(0.8)">
    <path d="M0,180 C20,140 60,120 60,80 C60,40 20,20 0,0 C-20,20 -60,40 -60,80 C-60,120 -20,140 0,180 Z" fill="#ff6a00" opacity="0.9"/>
    <path d="M0,140 C12,120 36,105 36,84 C36,63 12,50 0,30 C-12,50 -36,63 -36,84 C-36,105 -12,120 0,140 Z" fill="#ffd100" opacity="0.95"/>
  </g>
</svg>
EOF

cat > public/images/petro-angry-hero.svg <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="360" height="360" viewBox="0 0 360 360" role="img" aria-label="Stylized angry hero silhouette">
  <rect width="100%" height="100%" fill="#ffffff"/>
  <g transform="translate(60,20)" fill="#222">
    <ellipse cx="120" cy="140" rx="80" ry="100"/>
    <rect x="40" y="220" width="160" height="80" rx="18" />
    <path d="M70 90 C100 70 140 70 170 90" stroke="#fff" stroke-width="8" fill="none" stroke-linecap="round"/>
    <path d="M80 120 C110 110 140 110 170 120" stroke="#fff" stroke-width="6" fill="none" stroke-linecap="round"/>
  </g>
  <text x="50%" y="345" font-size="18" font-family="sans-serif" fill="#444" text-anchor="middle">Petro — stylized</text>
</svg>
EOF

cat > public/images/angry-crowd-silhouette.svg <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="200" viewBox="0 0 600 200" role="img" aria-label="Angry crowd silhouette">
  <rect width="100%" height="100%" fill="#fff"/>
  <g fill="#111">
    <circle cx="60" cy="60" r="18"/>
    <rect x="40" y="80" width="40" height="60" rx="8"/>
    <circle cx="140" cy="50" r="18"/>
    <rect x="120" y="70" width="40" height="70" rx="8"/>
    <circle cx="240" cy="60" r="18"/>
    <rect x="220" y="80" width="40" height="60" rx="8"/>
    <circle cx="340" cy="45" r="18"/>
    <rect x="320" y="65" width="40" height="75" rx="8"/>
    <circle cx="440" cy="60" r="18"/>
    <rect x="420" y="80" width="40" height="60" rx="8"/>
    <circle cx="540" cy="50" r="18"/>
    <rect x="520" y="70" width="40" height="70" rx="8"/>
  </g>
</svg>
EOF

cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Colombia Cyber</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
EOF

cat > src/main.jsx <<'EOF'
import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import "./styles.css";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
EOF

cat > src/styles.css <<'EOF'
:root{
  --bg-opacity: 0.06;
  --bg-blur: 2px;
  --max-width: 980px;
}

* { box-sizing: border-box; }

body, html, #root {
  height: 100%;
  margin: 0;
  font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
  background-color: #fafafa;
  color: #222;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* background wrapper */
.bg-container {
  position: relative;
  min-height: 100vh;
  overflow: hidden;
}

.bg-container::before {
  content: "";
  position: absolute;
  inset: 0;
  background-image: url('/images/colombian-flag.svg');
  background-size: cover;
  background-position: center;
  opacity: var(--bg-opacity);
  filter: blur(var(--bg-blur));
  transform: scale(1.02);
  z-index: 0;
  pointer-events: none;
}

.bg-container::after {
  content: "";
  position: absolute;
  inset: 0;
  background-image: url('/images/angry-crowd-silhouette.svg');
  background-repeat: no-repeat;
  background-position: right bottom;
  background-size: 40%;
  opacity: calc(var(--bg-opacity) * 0.9);
  filter: blur(calc(var(--bg-blur) * 0.6));
  z-index: 0;
  pointer-events: none;
}

.bg-content {
  position: relative;
  z-index: 1;
  min-height: 100vh;
}

/* navigation */
nav {
  display: flex;
  gap: 8px;
  padding: 12px;
  background: rgba(255,255,255,0.7);
  backdrop-filter: blur(6px);
  align-items: center;
  border-bottom: 1px solid rgba(0,0,0,0.06);
  position: sticky;
  top: 0;
}

nav button {
  padding: 6px 12px;
  border-radius: 6px;
  border: 1px solid #ddd;
  background: #fff;
  cursor: pointer;
}

nav button.active {
  background: #d4af37;
  color: #111;
  border-color: #caa43a;
}

/* simple container */
.container {
  max-width: var(--max-width);
  margin: 24px auto;
  padding: 16px;
}

/* hero / first section helpers to make it look good */
.hero {
  display: flex;
  gap: 18px;
  align-items: center;
  justify-content: space-between;
  padding: 48px 16px;
  background: rgba(255,255,255,0.72);
  border-radius: 12px;
  box-shadow: 0 8px 30px rgba(0,0,0,0.06);
}

.hero .left {
  flex: 1 1 60%;
}

.hero h1 {
  margin: 0 0 8px 0;
  font-size: 2.4rem;
  color: #1a1a1a;
}

.hero p {
  margin: 0;
  color: #333;
  opacity: 0.9;
}

/* small responsive tweaks */
@media (max-width: 720px) {
  .hero { flex-direction: column; text-align: center; }
  .hero .left { width: 100%; }
}
EOF

cat > src/components/Background.jsx <<'EOF'
import React from "react";

/**
 * Background wrapper.
 * Child content sits above faded background.
 */
export default function Background({ children }) {
  return <div className="bg-container"><div className="bg-content">{children}</div></div>;
}
EOF

cat > src/components/Navigation.jsx <<'EOF'
import React from "react";

export default function Navigation({ current, onNavigate }) {
  const links = [
    { name: "Home", id: "home" },
    { name: "Branding", id: "branding" },
    { name: "Flag", id: "flag" },
    { name: "Gallery", id: "gallery" },
    { name: "Auth", id: "auth" },
    { name: "Complaint", id: "complaint" },
    { name: "Chat", id: "chat" },
  ];
  return (
    <nav>
      {links.map(link => (
        <button
          key={link.id}
          onClick={() => onNavigate(link.id)}
          className={current === link.id ? "active" : ""}
          aria-current={current === link.id ? "page" : undefined}
        >
          {link.name}
        </button>
      ))}
    </nav>
  );
}
EOF

cat > src/components/Home.jsx <<'EOF'
import React from "react";

export default function Home() {
  return (
    <div className="container">
      <section className="hero">
        <div className="left">
          <h1>Welcome to Colombia Cyber</h1>
          <p>Your place for flag art, feedback and community. Share your voice, browse artwork, or send feedback.</p>
        </div>
        <div className="right">
          <img src="/images/colombian-flag.svg" alt="flag" style={{ width: 160 }} />
        </div>
      </section>
    </div>
  );
}
EOF

cat > src/components/Branding.jsx <<'EOF'
import React from "react";

export default function Branding() {
  return (
    <div className="container">
      <h1 style={{ color: "#d4af37", marginTop: 8 }}>Colombia Cyber</h1>
      <p>Empowering Colombian digital creativity and voice.</p>
      <img src="/images/colombian-flag.svg" alt="flag" style={{ width: 140, marginTop: 12 }} />
    </div>
  );
}
EOF

cat > src/components/FlagDisplay.jsx <<'EOF'
import React from "react";

export default function FlagDisplay() {
  return (
    <div className="container">
      <h2>Colombian Flag</h2>
      <img src="/images/colombian-flag.svg" alt="Colombian Flag" style={{ maxWidth: 480, width: "100%", border: "2px solid #000", borderRadius: 8 }} />
    </div>
  );
}
EOF

cat > src/components/ImageGallery.jsx <<'EOF'
import React from "react";

const images = [
  { src: "/images/colombian-flag-burning.svg", alt: "Flag Burning", caption: "Colombian Flag — burning (stylized)" },
  { src: "/images/petro-angry-hero.svg", alt: "Petro Hero", caption: "Petro — stylized hero" },
  { src: "/images/angry-crowd-silhouette.svg", alt: "Angry crowd", caption: "Angry crowd silhouette" },
];

export default function ImageGallery() {
  return (
    <div className="container">
      <h2>Image Gallery</h2>
      <div style={{ display: "flex", gap: 16, flexWrap: "wrap" }}>
        {images.map((img) => (
          <figure key={img.src} style={{ width: 220 }}>
            <img src={img.src} alt={img.alt} style={{ width: "100%", borderRadius: 6, border: "1px solid #e6e6e6" }} />
            <figcaption style={{ marginTop: 8 }}>{img.caption}</figcaption>
          </figure>
        ))}
      </div>
    </div>
  );
}
EOF

cat > src/components/Auth.jsx <<'EOF'
import React, { useState } from "react";

export default function Auth() {
  const [user, setUser] = useState("");
  const [pass, setPass] = useState("");
  const [auth, setAuth] = useState(false);

  function handleLogin(e) {
    e.preventDefault();
    if (user && pass) setAuth(true);
  }

  return (
    <div className="container">
      <h2>Sign In</h2>
      {auth ? (
        <div>
          <p>Welcome, <b>{user}</b>!</p>
        </div>
      ) : (
        <form onSubmit={handleLogin}>
          <input placeholder="Username" value={user} onChange={e => setUser(e.target.value)} style={{ marginRight: 8 }} />
          <input placeholder="Password" type="password" value={pass} onChange={e => setPass(e.target.value)} style={{ marginRight: 8 }} />
          <button type="submit">Login</button>
        </form>
      )}
    </div>
  );
}
EOF

cat > src/components/ComplaintForm.jsx <<'EOF'
import React, { useState } from "react";

export default function ComplaintForm() {
  const [submitted, setSubmitted] = useState(false);
  const [form, setForm] = useState({ subject: "", details: "" });

  function handleChange(e) {
    setForm({ ...form, [e.target.name]: e.target.value });
  }
  function handleSubmit(e) {
    e.preventDefault();
    setSubmitted(true);
  }

  return (
    <div className="container">
      <h2>Submit Feedback</h2>
      {submitted ? (
        <div>
          <p>Thanks — your feedback was received.</p>
          <pre>{JSON.stringify(form, null, 2)}</pre>
        </div>
      ) : (
        <form onSubmit={handleSubmit}>
          <div>
            <input name="subject" placeholder="Subject" value={form.subject} onChange={handleChange} style={{ width: "100%", marginBottom: 8 }} />
          </div>
          <div>
            <textarea name="details" placeholder="Details" value={form.details} onChange={handleChange} rows={6} style={{ width: "100%" }} />
          </div>
          <button type="submit" style={{ marginTop: 8 }}>Submit</button>
        </form>
      )}
    </div>
  );
}
EOF

cat > src/components/Chat.jsx <<'EOF'
import React, { useState } from "react";

export default function Chat() {
  const [messages, setMessages] = useState([{ from: "system", text: "Welcome to Colombia Cyber Chat!" }]);
  const [input, setInput] = useState("");

  function sendMessage(e) {
    e.preventDefault();
    if (!input.trim()) return;
    setMessages(m => [...m, { from: "user", text: input }]);
    setInput("");
  }

  return (
    <div className="container">
      <h2>Chat</h2>
      <div style={{ minHeight: 120, marginBottom: 12 }}>
        {messages.map((m, i) => (
          <div key={i} style={{ textAlign: m.from === "user" ? "right" : "left", margin: "6px 0" }}>
            <span style={{ display: "inline-block", padding: "6px 10px", borderRadius: 8, background: m.from === "user" ? "#d4af37" : "#eee" }}>{m.text}</span>
          </div>
        ))}
      </div>
      <form onSubmit={sendMessage} style={{ display: "flex", gap: 8 }}>
        <input value={input} onChange={e => setInput(e.target.value)} placeholder="Type a message..." style={{ flex: 1 }} />
        <button type="submit">Send</button>
      </form>
    </div>
  );
}
EOF

cat > src/App.jsx <<'EOF'
import React, { useState } from "react";
import Background from "./components/Background";
import Navigation from "./components/Navigation";
import Home from "./components/Home";
import Branding from "./components/Branding";
import FlagDisplay from "./components/FlagDisplay";
import ImageGallery from "./components/ImageGallery";
import Auth from "./components/Auth";
import ComplaintForm from "./components/ComplaintForm";
import Chat from "./components/Chat";

export default function App() {
  const [page, setPage] = useState("home");

  return (
    <Background>
      <Navigation current={page} onNavigate={setPage} />
      {page === "home" && <Home />}
      {page === "branding" && <Branding />}
      {page === "flag" && <FlagDisplay />}
      {page === "gallery" && <ImageGallery />}
      {page === "auth" && <Auth />}
      {page === "complaint" && <ComplaintForm />}
      {page === "chat" && <Chat />}
    </Background>
  );
}
EOF

cat > README.md <<'EOF'
# Colombia Cyber — Starter

This repository scaffold includes a Vite + React starter, SVG placeholders, a subtle faded background, and example components.

How to use
1. Checkout the branch `colombia-cyber-starter`.
2. Run:
   npm install
   npm run dev

Notes
- The branch adds starter files and sample artwork. Review the branch and open a PR when ready.
EOF

git add .
git commit -m "Add Colombia Cyber starter scaffold (remaining files)" || echo "No changes to commit"
git push -u origin "${BRANCH}"

echo "Done. Files added and pushed to ${BRANCH} (if there were changes)."
