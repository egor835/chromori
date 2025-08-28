(() => {
    const env = JSON.parse(chromori.fetchSync("/env").res);
    globalThis.process = {
        env,
        versions: { nw: "0.29.0" },
        platform: env._PLATFORM,
        browser: true,
        cwd: () => env._CWD,
    };
})();
