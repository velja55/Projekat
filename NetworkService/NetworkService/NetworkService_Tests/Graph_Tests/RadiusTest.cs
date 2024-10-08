﻿using System.Collections.Generic;
using System.Threading;
using NetworkService.Model;
using NetworkService.Properties;
using NetworkService.ViewModel;
using NUnit.Framework;

namespace GraphTests
{
    [TestFixture]
    public class RadiusTest
    {
        private GraphViewModel _viewModel;

        [SetUp]
        public void Setup()
        {
            var staThread = new Thread(() =>
            {
                _viewModel = new GraphViewModel();
            });

            staThread.SetApartmentState(ApartmentState.STA);
            staThread.Start();
            staThread.Join();
        }

        [Test]
        public void ChangeRadiusGraph_IDSePoklapaSaSelektovanim()
        {
            // Arrange
            var entity = new PressureInVentil(1, "Ventil 1", Resources.CableSensorString, "image.png")
            {
                lastFive = new List<double> { 3, 6, 9, 12, 15 }
            };
            _viewModel.SelectedEntity = entity;

            // Act
            _viewModel.ChangeRadiusGraph(entity);

            // Assert
            Assert.That(_viewModel.Radius1, Is.EqualTo(7));  // 3 * 2 + 1
            Assert.That(_viewModel.Radius2, Is.EqualTo(13)); // 6 * 2 + 1
            Assert.That(_viewModel.Radius3, Is.EqualTo(19)); // 9 * 2 + 1
            Assert.That(_viewModel.Radius4, Is.EqualTo(25)); // 12 * 2 + 1
            Assert.That(_viewModel.Radius5, Is.EqualTo(31)); // 15 * 2 + 1
        }

        [Test]
        public void ChangeRadiusGraph_IDSeNePoklapaSaSelectovanim()
        {
            // Arrange
            var entity1 = new PressureInVentil(1, "Ventil 1", Resources.CableSensorString, "image.png");
            var entity2 = new PressureInVentil(2, "Ventil 2", Resources.DigitalManometarString, "image2.png")
            {
                lastFive = new List<double> { 5, 7, 11, 13, 17 }
            };
            _viewModel.SelectedEntity = entity1;

            // Act
            _viewModel.ChangeRadiusGraph(entity2);

            // Assert
            Assert.That(_viewModel.Radius1, Is.EqualTo(1));
            Assert.That(_viewModel.Radius2, Is.EqualTo(1));
            Assert.That(_viewModel.Radius3, Is.EqualTo(1));
            Assert.That(_viewModel.Radius4, Is.EqualTo(1));
            Assert.That(_viewModel.Radius5, Is.EqualTo(1));
        }

        [Test]
        public void ChangeRadiusGraph_UpdateColors_KadaSeIDPoklapaSaSelektovanim()
        {
            // Arrange
            var entity = new PressureInVentil(1, "Ventil 1", Resources.DigitalManometarString, "image.png")
            {
                lastFive = new List<double> { 5, 10, 3, 15, 20 }
            };
            _viewModel.SelectedEntity = entity;

            // Act
            _viewModel.ChangeRadiusGraph(entity);

            // Assert
            Assert.That(_viewModel.Color1, Is.EqualTo(Resources.ColorBlue)); // 5 je unutar opsega
            Assert.That(_viewModel.Color2, Is.EqualTo(Resources.ColorBlue)); // 10 je unutar opsega
            Assert.That(_viewModel.Color3, Is.EqualTo(Resources.RedColor));  // 3 je izvan opsega
            Assert.That(_viewModel.Color4, Is.EqualTo(Resources.ColorBlue)); // 15 je unutar opsega
            Assert.That(_viewModel.Color5, Is.EqualTo(Resources.RedColor));  // 20 je izvan opsega
        }

        [Test]
        public void ChangeRadiusGraph_UpdateTextValues_NEPolapaSeId()
        {
            // Arrange
            var entity = new PressureInVentil(1, "Ventil 1",Resources.CableSensorString, "image.png")
            {
                lastFiveTime = new List<string> { "08:00", "09:00", "10:00", "11:00", "12:00" }
            };
            _viewModel.SelectedEntity = entity;

            // Act
            _viewModel.ChangeRadiusGraph(entity);

            // Assert
            Assert.That(_viewModel.Text1, Is.EqualTo("08:00"));
            Assert.That(_viewModel.Text2, Is.EqualTo("09:00"));
            Assert.That(_viewModel.Text3, Is.EqualTo("10:00"));
            Assert.That(_viewModel.Text4, Is.EqualTo("11:00"));
            Assert.That(_viewModel.Text5, Is.EqualTo("12:00"));
        }

        [Test]
        public void ChangeRadiusGraph_UpdateSelectedValue_KadaSeIdPoklapa()
        {
            var entity = new PressureInVentil(1, "Ventil 1", "Type A", "image.png")
            {
                Value = 100.5
            };
            _viewModel.SelectedEntity = entity;
            _viewModel.ChangeRadiusGraph(entity);
            Assert.That(_viewModel.SelectedValue, Is.EqualTo(100.5));
        }

    }
}
