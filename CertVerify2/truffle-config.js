module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,       // Ganache GUI Port
      network_id: "5777", // Ganache GUI Network ID
    },
  },
  compilers: {
    solc: {
      version: "0.8.10",
    },
  },
};