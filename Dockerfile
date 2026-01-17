FROM diygod/rsshub:chromium-bundled

# 基础环境变量
ENV NODE_ENV=production
ENV CACHE_TYPE=memory

# Puppeteer/Chromium配置
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV CHROMIUM_FLAGS="--no-sandbox --disable-dev-shm-usage --disable-gpu --single-process --disable-setuid-sandbox"

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:1200/healthz || exit 1

# 暴露端口
EXPOSE 1200

# 启动命令
CMD ["node", "lib/index.js"]
