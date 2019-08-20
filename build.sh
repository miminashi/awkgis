#!/bin/sh

output="distance"

tmp=$(mktemp)

cat > "${tmp}" <<'EOF'
#!/bin/sh
awk '
EOF

cat hubeny.awk |
grep -v '^ *#' |
grep -v '^$' >> "${tmp}"

cat >> "${tmp}" <<'EOF'
'
EOF

chmod +x "${tmp}"
mv "${tmp}" "${output}"
