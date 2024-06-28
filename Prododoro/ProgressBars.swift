import SwiftUI
struct ProgressBars: View {
  var width: CGFloat = 200
  var height: CGFloat = 20
  var percent: CGFloat = 60
    var color1 = Color(#colorLiteral(red: 0.4222292304, green: 0.8122685552, blue: 0.9785436988, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.6985085607, green: 0.5792450905, blue: 1, alpha: 1))
  var body: some View {
    let multiplier = width / 100
    ZStack(alignment: .leading) {
        RoundedRectangle(cornerRadius: height, style: .continuous)
          .frame(width: width, height: height)
          .foregroundColor(Color.black.opacity(0.1))
        RoundedRectangle(cornerRadius: height, style: .continuous)
          .frame(width: percent * multiplier, height: height)
          .background(
            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
              .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
          )
          .foregroundColor(.clear)
      }
  }
}
#Preview {
  ProgressBars()
}
