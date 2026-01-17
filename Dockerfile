FROM diygod/rsshub:chromium-bundled

# 设置环境变量
ENV NODE_ENV=production
ENV CACHE_TYPE=memory  # 使用内存缓存，避免Redis依赖
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:1200/healthz || exit 1

# 暴露端口
EXPOSE 1200

# 启动命令
CMD ["node", "lib/index.js"]
