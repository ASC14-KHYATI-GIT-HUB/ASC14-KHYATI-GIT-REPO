public class SpecialMovie extends MovieTest {
        private String soundEffectsTechnology;
        private String visualEffectsTechnology;

        public SpecialMovie(String movieName, String producedBy, String soundEffectsTechnology, String visualEffectsTechnology) {
            super(movieName, producedBy); 
            this.soundEffectsTechnology = soundEffectsTechnology;
            this.visualEffectsTechnology = visualEffectsTechnology;
        }

        public void displaySpecialInfo() {
            displayBasicInfo();
            System.out.println("Sound Effects Technology: " + soundEffectsTechnology);
            System.out.println("Visual Effects Technology: " + visualEffectsTechnology);
        }
    }

