module.exports = {
  plugins: [
    require('precss'),
    require('autoprefixer')({
      grid: true,
      browsers: ['> 1%', 'last 2 versions']
    })
  ]
}
