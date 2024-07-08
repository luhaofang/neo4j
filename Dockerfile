# 使用官方 Neo4j 5.21.0 社区版镜像作为基础镜像
FROM neo4j:5.20.0-community as base

# 添加必要的 Neo4j 配置
RUN echo 'dbms.security.procedures.unrestricted=apoc.*' >> /var/lib/neo4j/conf/neo4j.conf

# 暴露 Neo4j 的默认端口
EXPOSE 7474 7473 7687

# 继承基础镜像的入口点和命令
ENTRYPOINT ["tini", "-g", "--", "/startup/docker-entrypoint.sh"]
CMD ["neo4j"]
